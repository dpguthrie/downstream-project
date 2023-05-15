with dbtc_source as (

    select
        event_text,
        context_library_version,
        context_page_referrer,
        context_page_url,
        event,
        context_ip,
        context_page_path,
        context_page_title,
        received_at,
        sent_at,
        timestamp,
        uuid_ts,
        context_locale,
        context_user_agent,
        id,
        original_timestamp,
        anonymous_id,
        context_library_name,
        'dbtc' as src

    from {{ ref('upstream', 'stg_dbtc__tracks') }}

),

yahooquery_source as (

    select
        event_text,
        context_library_version,
        context_page_referrer,
        context_page_url,
        event,
        context_ip,
        context_page_path,
        context_page_title,
        received_at,
        sent_at,
        timestamp,
        uuid_ts,
        context_locale,
        context_user_agent,
        id,
        original_timestamp,
        anonymous_id,
        context_library_name,
        'yahooquery' as src

    from {{ ref('upstream', 'stg_yahooquery__tracks') }}

)

select * from yahooquery_source
union all
select * from dbtc_source
