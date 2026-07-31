With ocp_cte as (
    SELECT
        state_code,
        CAST(housing_units_occupied_count AS DECIMAL(18,4))
        / NULLIF(housing_units_occupancy_status_total_count, 0)
            AS occupancy_rate_per_state
      FROM dbo.demographics_US
  )

SELECT
    /* Property Attributes */
      p.property_name                                    AS property_name
    , p.property_state                                   AS property_state
    , s.state_name                                       AS property_state_name
    , s.state_id                                         AS property_state_id
    , p.zip_code                                         AS property_zip_code
    , p.property_type                                    AS property_type
    , p.property_subtype                                 AS property_subtype

    /* Property Characteristics */
    , p.total_units                                      AS total_units
    , p.occupancy                                        AS occupancy_rate
    , p.latitude                                         AS property_latitude
    , p.longitude                                        AS property_longitude
    , ocp.occupancy_rate_per_state                       AS occupancy_rate_per_state
    ,case 
        when p.occupancy > ocp.occupancy_rate_per_state then 'Above'
        when p.occupancy < ocp.occupancy_rate_per_state then 'Below'
        else 'N/A'
     end                                                 AS property_occupancy_vs_state_indicator

    /* Loan Attributes */
    , p.loan_purpose_acquisition_refinance               AS loan_purpose
    , p.original_loan_amount                             AS original_loan_amount
    , p.maturity_balance                                 AS maturity_balance
    , p.gross_interest_rate                              AS gross_interest_rate

    /* Valuation Metrics */
    , p.appraised_value                                  AS property_appraised_value

    /* Income Metrics */
    , p.uw_noi                                           AS underwriting_net_operating_income_amount
    , p.uw_ncf_dscr                                      AS underwriting_debt_service_coverage_ratio
    , p.most_recent_noi                                  AS most_recent_net_operating_income_amount
    , p.[_2nd_most_recent_noi]                           AS prior_period_net_operating_income_amount

    /* Rent Metrics */
    , p.monthly_rent_per_unit                            AS monthly_rent_per_unit_amount
    , p.monthly_rent_per_unit * 12                       AS annual_rent_per_unit_amount
    , p.monthly_debt_service_amount_io                   AS monthly_debt_service_interest_only_amount

    /* Demographic Metrics */
    , d.gross_rent_median                                AS demographic_monthly_gross_rent_median_amount
    , d.gross_rent_median * 12                           AS demographic_annual_gross_rent_median_amount
    , d.household_income_median                          AS demographic_household_income_median_amount

    /* Cap Rate */
    , CAST(p.uw_noi AS DECIMAL(18,4))
        / NULLIF(p.appraised_value, 0)                   AS cap_rate_value

    , DENSE_RANK() OVER
        (
            PARTITION BY p.property_state
            ORDER BY
                CAST(p.uw_noi AS DECIMAL(18,4))
                / NULLIF(p.appraised_value, 0) DESC
        )                                                AS property_state_cap_rate_ranking

    /* Rent Premium to Market */
    , ROUND(
          (
              p.monthly_rent_per_unit
              - d.gross_rent_median
          )
          / NULLIF(CAST(d.gross_rent_median AS DECIMAL(18,4)), 0)
          * 100.0
        , 2
      )                                                  AS monthly_rent_difference_percent

    /* Affordability */
    , ROUND(
          (
              p.monthly_rent_per_unit * 12.0
          )
          / NULLIF(d.household_income_median, 0)
          * 100.0
        , 2
      )                                                  AS annual_rent_affordability_percent

    , DENSE_RANK() OVER
        (
            PARTITION BY p.property_state
            ORDER BY
                (
                    p.monthly_rent_per_unit * 12.0
                )
                / NULLIF(d.household_income_median, 0) ASC
        )                                                AS affordability_rank_in_state

    /* NOI Per Unit */
    , ROUND(
          p.uw_noi
          / NULLIF(p.total_units, 0)
        , 2
      )                                                  AS noi_per_unit

    , DENSE_RANK() OVER
        (
            PARTITION BY p.property_state
            ORDER BY
                ROUND(
                    p.uw_noi
                    / NULLIF(p.total_units, 0)
                , 2) DESC
        )                                                AS state_noi_per_unit_rank

    /* Net Cash Flow Per Unit */
    , ROUND(
          p.uw_ncf
          / NULLIF(p.total_units, 0)
        , 2
      )                                                  AS ncf_per_unit

FROM dbo.property_dataset_sample      AS p WITH (NOLOCK)
INNER JOIN dbo.states_codes_mapping   AS s WITH (NOLOCK)
    ON p.property_state = s.state_code
INNER JOIN dbo.demographics_us        AS d WITH (NOLOCK)
    ON s.state_id = d.state_code
INNER JOIN ocp_cte                    AS ocp WITH(NOLOCK)
    ON d.state_code = ocp.state_code
ORDER BY
    p.uw_noi DESC;

