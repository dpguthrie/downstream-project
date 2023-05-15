with dbtc_source as (

    select
        anonymous_id,
        context_locale,
        context_page_referrer,
        url,
        uuid_ts,
        context_library_name,
        context_library_version,
        id,
        received_at,
        title,
        context_page_title,
        path,
        referrer,
        timestamp,
        original_timestamp,
        sent_at,
        context_ip,
        context_page_path,
        context_page_url,
        context_user_agent,
        'dbtc' as src

    from {{ source('dbtc', 'stg_dbtc__pages') }}

),

yahooquery_source as (

    select
        anonymous_id,
        context_locale,
        context_page_referrer,
        url,
        uuid_ts,
        context_library_name,
        context_library_version,
        id,
        received_at,
        title,
        context_page_title,
        path,
        referrer,
        timestamp,
        original_timestamp,
        sent_at,
        context_ip,
        context_page_path,
        context_page_url,
        context_user_agent,
        'yahooquery' as src

    from {{ source('yahooquery', 'stg_yahooquery__pages') }}

)

select * from yahooquery_source
union all
select * from dbtc_source
