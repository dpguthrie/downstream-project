with dbtc_source as (

    select
        id,
        original_timestamp,
        received_at,
        timestamp,
        anonymous_id,
        context_ip,
        context_user_agent,
        link,
        context_library_version,
        event,
        event_text,
        uuid_ts,
        context_page_title,
        context_page_url,
        sent_at,
        context_library_name,
        context_locale,
        context_page_path,
        context_page_referrer,
        'dbtc' as src

    from {{ ref('upstream', 'stg_dbtc__link_clicked') }}

),

yahooquery_source as (

    select
        id,
        original_timestamp,
        received_at,
        timestamp,
        anonymous_id,
        context_ip,
        context_user_agent,
        link,
        context_library_version,
        event,
        event_text,
        uuid_ts,
        context_page_title,
        context_page_url,
        sent_at,
        context_library_name,
        context_locale,
        context_page_path,
        context_page_referrer,
        'yahooquery' as src

    from {{ ref('upstream', 'stg_yahooquery__link_clicked') }}

)

select * from yahooquery_source
union all
select * from dbtc_source
