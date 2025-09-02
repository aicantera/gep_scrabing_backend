--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO supabase_admin;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: buscar_diputados(text); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.buscar_diputados(palabras text) RETURNS TABLE(id_funcionario bigint, created_at timestamp with time zone, institucion text, nombre text, partido text, representacion text)
    LANGUAGE plpgsql
    AS $$DECLARE
  palabras_array text[];
  sql_where text := '';
  i int;
BEGIN
  palabras_array := string_to_array(palabras, ' ');

  FOR i IN array_lower(palabras_array, 1)..array_upper(palabras_array, 1) LOOP
    sql_where := sql_where || format(
      ' AND unaccent(nombre) ILIKE unaccent(''%%%s%%'')',
      palabras_array[i]
    );
  END LOOP;

  RETURN QUERY EXECUTE format(
    'SELECT id_funcionario, created_at, institucion, nombre, partido, representacion
     FROM listaod_seandores_diputados
     WHERE true %s',
    sql_where
  );
END;$$;


ALTER FUNCTION public.buscar_diputados(palabras text) OWNER TO supabase_admin;

--
-- Name: match_documentos(public.vector, integer, jsonb); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.match_documentos(query_embedding public.vector, match_count integer DEFAULT NULL::integer, filter jsonb DEFAULT '{}'::jsonb) RETURNS TABLE(id bigint, content text, metadata jsonb, similarity double precision)
    LANGUAGE plpgsql
    AS $$
#variable_conflict use_column
begin
  return query
  select
    id,
    content,
    metadata,
    1 - (documents_diputados.embedding <=> query_embedding) as similarity
  from documents_diputados
  where metadata @> filter
  order by documents_diputados.embedding <=> query_embedding
  limit match_count;
end;
$$;


ALTER FUNCTION public.match_documentos(query_embedding public.vector, match_count integer, filter jsonb) OWNER TO supabase_admin;

--
-- Name: match_documents_diputados(public.vector, integer, jsonb); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.match_documents_diputados(query_embedding public.vector, match_count integer DEFAULT NULL::integer, filter jsonb DEFAULT '{}'::jsonb) RETURNS TABLE(id bigint, content text, metadata jsonb, similarity double precision)
    LANGUAGE plpgsql
    AS $$
#variable_conflict use_column
begin
  return query
  select
    id,
    content,
    metadata,
    1 - (documents_diputados.embedding <=> query_embedding) as similarity
  from documents
  where metadata @> filter
  order by documents_diputados.embedding <=> query_embedding
  limit match_count;
end;
$$;


ALTER FUNCTION public.match_documents_diputados(query_embedding public.vector, match_count integer, filter jsonb) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
BEGIN
    RETURN query EXECUTE
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name || '/' AS name,
                    NULL::uuid AS id,
                    NULL::timestamptz AS updated_at,
                    NULL::timestamptz AS created_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
                ORDER BY prefixes.name COLLATE "C" LIMIT $3
            )
            UNION ALL
            (SELECT split_part(name, '/', $4) AS key,
                name,
                id,
                updated_at,
                created_at,
                metadata
            FROM storage.objects
            WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
            ORDER BY name COLLATE "C" LIMIT $3)
        ) obj
        ORDER BY name COLLATE "C" LIMIT $3;
        $sql$
        USING prefix, bucket_name, limits, levels, start_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: alertas_directorio; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.alertas_directorio (
    id_alerta bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    id_cliente uuid DEFAULT gen_random_uuid(),
    status_alerta boolean DEFAULT false,
    temas text,
    sub_tema text,
    fuente text,
    estado text,
    id_doc_senado bigint,
    id_analista text,
    enviado_correo boolean,
    datetime_enviado_correo timestamp with time zone,
    link_pdf_enviado text
);


ALTER TABLE public.alertas_directorio OWNER TO supabase_admin;

--
-- Name: COLUMN alertas_directorio.id_doc_senado; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.alertas_directorio.id_doc_senado IS 'id del doc capturado que coincido';


--
-- Name: COLUMN alertas_directorio.id_analista; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.alertas_directorio.id_analista IS 'id_analista que edito aprobo o rechazo la alerta';


--
-- Name: alertas_directorio_id_alerta_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.alertas_directorio ALTER COLUMN id_alerta ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.alertas_directorio_id_alerta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bot_executions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.bot_executions (
    id integer NOT NULL,
    fuente text NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    tipo text NOT NULL,
    ejecutado_por text,
    estatus text NOT NULL,
    detalles jsonb
);


ALTER TABLE public.bot_executions OWNER TO supabase_admin;

--
-- Name: bot_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

CREATE SEQUENCE public.bot_executions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bot_executions_id_seq OWNER TO supabase_admin;

--
-- Name: bot_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supabase_admin
--

ALTER SEQUENCE public.bot_executions_id_seq OWNED BY public.bot_executions.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.clientes (
    id_cliente uuid DEFAULT gen_random_uuid() NOT NULL,
    empresa_admin bigint,
    nombre_cliente text,
    cargo text,
    email text,
    telefono text,
    temas_suscrit text[],
    estado text NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    listas_distribucion jsonb,
    logo text,
    siglas text,
    id_cliente_numerico smallint NOT NULL
);


ALTER TABLE public.clientes OWNER TO supabase_admin;

--
-- Name: clientes_id_cliente_numerico_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.clientes ALTER COLUMN id_cliente_numerico ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.clientes_id_cliente_numerico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: emails; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.emails (
    id_email bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    email text,
    email_status boolean,
    email_nombre_dest text,
    telefono_nombre_destino text
);


ALTER TABLE public.emails OWNER TO supabase_admin;

--
-- Name: emails_id_email_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.emails ALTER COLUMN id_email ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.emails_id_email_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.empresas (
    id_empresa bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    id_usuario smallint,
    nombre_em text,
    rfc text,
    giro text,
    sitio_web text
);


ALTER TABLE public.empresas OWNER TO supabase_admin;

--
-- Name: empresas_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.empresas ALTER COLUMN id_empresa ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.empresas_id_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gep_ia_attributes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.gep_ia_attributes (
    id_attribute bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    id_person smallint,
    attribute_text text,
    attribute_desc text
);


ALTER TABLE public.gep_ia_attributes OWNER TO supabase_admin;

--
-- Name: gep_ia_attributes_id_attribute_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_attributes ALTER COLUMN id_attribute ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.gep_ia_attributes_id_attribute_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gep_ia_personas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.gep_ia_personas (
    id_person bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    person_full_name text,
    person_status boolean DEFAULT true
);


ALTER TABLE public.gep_ia_personas OWNER TO supabase_admin;

--
-- Name: gep_ia_personas_id_person_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_personas ALTER COLUMN id_person ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.gep_ia_personas_id_person_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gep_ia_relation_type; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.gep_ia_relation_type (
    id_type_relation_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    type_relation_text text,
    type_relation_desc text,
    type_relation_status boolean DEFAULT true
);


ALTER TABLE public.gep_ia_relation_type OWNER TO supabase_admin;

--
-- Name: gep_ia_relation_type_id_type_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_relation_type ALTER COLUMN id_type_relation_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.gep_ia_relation_type_id_type_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gep_ia_relations; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.gep_ia_relations (
    id_relation bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    mother_id_person integer,
    child_id_person integer,
    id_type_relation_id integer,
    peso smallint DEFAULT '1'::smallint
);


ALTER TABLE public.gep_ia_relations OWNER TO supabase_admin;

--
-- Name: gep_ia_relations_id_relation_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_relations ALTER COLUMN id_relation ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.gep_ia_relations_id_relation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: listaod_seandores_diputados; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.listaod_seandores_diputados (
    id_funcionario bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    institucion text,
    nombre text,
    partido text,
    representacion text
);


ALTER TABLE public.listaod_seandores_diputados OWNER TO supabase_admin;

--
-- Name: listaod_seandores_diputados_id_funcionario_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.listaod_seandores_diputados ALTER COLUMN id_funcionario ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.listaod_seandores_diputados_id_funcionario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: logs_de_bots; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.logs_de_bots (
    id_log_bot bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    bot_ejecutado text,
    duracion_ejecucion text,
    ejecutado_por text DEFAULT 'sistema'::text,
    status_ejecucion smallint DEFAULT '1'::smallint
);


ALTER TABLE public.logs_de_bots OWNER TO supabase_admin;

--
-- Name: logs_debots_id_log_bot_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.logs_de_bots ALTER COLUMN id_log_bot ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.logs_debots_id_log_bot_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: scrape_busquedas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.scrape_busquedas (
    id_scrape_busqueda bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    busqueda text,
    descripcion text,
    cuentas_relacionadas text,
    tiempo text,
    status_busqueda boolean DEFAULT true
);


ALTER TABLE public.scrape_busquedas OWNER TO supabase_admin;

--
-- Name: scrape_busquedas_id_scrape_busqueda_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.scrape_busquedas ALTER COLUMN id_scrape_busqueda ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.scrape_busquedas_id_scrape_busqueda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: scrape_tw_cuentas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.scrape_tw_cuentas (
    id_scrape bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    handle text,
    nombre text,
    red text,
    status_user boolean DEFAULT true,
    id_scrape_busqueda bigint
);


ALTER TABLE public.scrape_tw_cuentas OWNER TO supabase_admin;

--
-- Name: scrape_tw_cuentas_id_scrape_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.scrape_tw_cuentas ALTER COLUMN id_scrape ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.scrape_tw_cuentas_id_scrape_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: senado; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.senado (
    id_senado_doc bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    sinopsis text,
    iniciativa_texto text,
    iniciativa_id text,
    gaceta text,
    link_iniciativa text,
    fuente text DEFAULT 'senado'::text,
    imagen_link text,
    temas text,
    personas text,
    partidos text,
    leyes text,
    resumen text,
    analisis text,
    objeto text,
    correspondiente text,
    tipo text,
    analizado boolean DEFAULT false,
    "Proponente" text,
    transitorios text,
    link_documento text,
    titulo text,
    keywords text,
    subtema text,
    dependencia text,
    ultimo_doc_expediente text,
    ver_expediente text
);


ALTER TABLE public.senado OWNER TO supabase_admin;

--
-- Name: senado_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.senado ALTER COLUMN id_senado_doc ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.senado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: subtemas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.subtemas (
    id_subtema bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    id_tema smallint,
    subtema_text text,
    subtema_desc text
);


ALTER TABLE public.subtemas OWNER TO supabase_admin;

--
-- Name: subtemas_id_subtema_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.subtemas ALTER COLUMN id_subtema ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.subtemas_id_subtema_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: temas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.temas (
    id_tema bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre_tema text,
    desc_tema text,
    activo boolean DEFAULT true
);


ALTER TABLE public.temas OWNER TO supabase_admin;

--
-- Name: temas_id_tema_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.temas ALTER COLUMN id_tema ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.temas_id_tema_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: unidades_empresas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.unidades_empresas (
    id_unidad bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre_unidad_interna text,
    id_usuario smallint
);


ALTER TABLE public.unidades_empresas OWNER TO supabase_admin;

--
-- Name: unidades_empresas_id_unidad_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.unidades_empresas ALTER COLUMN id_unidad ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.unidades_empresas_id_unidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid DEFAULT gen_random_uuid(),
    nombre text,
    apellido text,
    email text,
    perfil text,
    activo boolean,
    password_hash text
);


ALTER TABLE public.usuarios OWNER TO supabase_admin;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.usuarios ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vista_relaciones_con_atributos; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.vista_relaciones_con_atributos AS
 SELECT r.id_relation,
    r.created_at AS fecha_relacion,
    r.peso,
    r.mother_id_person,
    madre.person_full_name AS nombre_madre,
    madre_attrs.atributos_madre,
    r.child_id_person,
    hijo.person_full_name AS nombre_hijo,
    hijo_attrs.atributos_hijo,
    rt.id_type_relation_id,
    rt.type_relation_text AS tipo_relacion,
    rt.type_relation_desc AS descripcion_relacion
   FROM (((((public.gep_ia_relations r
     LEFT JOIN public.gep_ia_personas madre ON ((r.mother_id_person = madre.id_person)))
     LEFT JOIN public.gep_ia_personas hijo ON ((r.child_id_person = hijo.id_person)))
     LEFT JOIN public.gep_ia_relation_type rt ON ((r.id_type_relation_id = rt.id_type_relation_id)))
     LEFT JOIN LATERAL ( SELECT json_agg(json_build_object('id_attribute', a.id_attribute, 'attribute_text', a.attribute_text, 'attribute_desc', a.attribute_desc, 'created_at', a.created_at)) AS atributos_madre
           FROM public.gep_ia_attributes a
          WHERE (a.id_person = r.mother_id_person)) madre_attrs ON (true))
     LEFT JOIN LATERAL ( SELECT json_agg(json_build_object('id_attribute', a.id_attribute, 'attribute_text', a.attribute_text, 'attribute_desc', a.attribute_desc, 'created_at', a.created_at)) AS atributos_hijo
           FROM public.gep_ia_attributes a
          WHERE (a.id_person = r.child_id_person)) hijo_attrs ON (true))
  ORDER BY r.created_at DESC;


ALTER TABLE public.vista_relaciones_con_atributos OWNER TO supabase_admin;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: bot_executions id; Type: DEFAULT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.bot_executions ALTER COLUMN id SET DEFAULT nextval('public.bot_executions_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
8aa5c2fc-ac99-4d1d-a014-e8f51d5cf5eb	postgres_cdc_rls	{"region": "us-east-1", "db_host": "QhixI0o7PYIABziLUL4f0A==", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "+enMDFi1J/3IrrquHHwUmA==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "eGxa2ZKVreSn7eWieRQdp74vN25K+qFgdnxmDCKe4p20+C0410WXonzXTEj9CgYx", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2025-08-08 19:31:08	2025-08-08 19:31:08
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2025-05-21 05:29:19
20220329161857	2025-05-21 05:29:19
20220410212326	2025-05-21 05:29:19
20220506102948	2025-05-21 05:29:19
20220527210857	2025-05-21 05:29:19
20220815211129	2025-05-21 05:29:19
20220815215024	2025-05-21 05:29:19
20220818141501	2025-05-21 05:29:19
20221018173709	2025-05-21 05:29:19
20221102172703	2025-05-21 05:29:19
20221223010058	2025-05-21 05:29:19
20230110180046	2025-05-21 05:29:19
20230810220907	2025-05-21 05:29:19
20230810220924	2025-05-21 05:29:19
20231024094642	2025-05-21 05:29:19
20240306114423	2025-05-21 05:29:19
20240418082835	2025-05-21 05:29:19
20240625211759	2025-05-21 05:29:19
20240704172020	2025-05-21 05:29:19
20240902173232	2025-05-21 05:29:19
20241106103258	2025-05-21 05:29:19
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks, notify_private_alpha, private_only) FROM stdin;
51379bac-ce0e-405d-9f0e-e080b2a015c3	realtime-dev	realtime-dev	eGxa2ZKVreSn7eWieRQdp60i5H6KJLiST7splFU6MVHylMSAoQ2SjsTrTTQo/+bmYjQcO4hNnGTU+D1wtlXreA==	200	2025-08-08 19:31:08	2025-08-08 19:31:08	100	postgres_cdc_rls	100000	100	100	f	\N	f	f
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	0fe1dd8a-5c38-40f2-8a21-bf9208fd732e	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"admin@admin.com","user_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","user_phone":""}}	2025-05-28 16:22:51.571162+00	
00000000-0000-0000-0000-000000000000	1c289fd2-b861-43d5-8558-0cb6e3a0e711	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 16:23:09.013894+00	
00000000-0000-0000-0000-000000000000	5e396b24-43a3-44cc-b443-ea4d8ed64e75	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 16:29:40.220913+00	
00000000-0000-0000-0000-000000000000	d7d65a7f-2553-496b-b8f7-d6ecddeca2e2	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 16:29:50.19825+00	
00000000-0000-0000-0000-000000000000	ac35d2c8-8d07-484f-a352-f4aedf0cb8ce	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:19:43.224575+00	
00000000-0000-0000-0000-000000000000	0b5e9f06-46fb-435f-9d9b-e2df5c9ac7bf	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 17:20:00.364026+00	
00000000-0000-0000-0000-000000000000	50271d05-38f3-4c90-9ef8-327ccf954251	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:30:51.122846+00	
00000000-0000-0000-0000-000000000000	d621b31e-74ba-4a74-83da-f37ff3ee12a7	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 17:33:29.912813+00	
00000000-0000-0000-0000-000000000000	285fc312-09f3-46b1-b109-c0d886d0f8de	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:34:38.12378+00	
00000000-0000-0000-0000-000000000000	f315f37c-96d6-49ce-9ecf-2c7748a61579	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:34:41.119318+00	
00000000-0000-0000-0000-000000000000	6a400c58-c472-4c53-9106-c36226d5f8b8	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 17:34:45.722527+00	
00000000-0000-0000-0000-000000000000	4cf69544-9046-4535-9268-c62c8298fa8e	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:36:24.451293+00	
00000000-0000-0000-0000-000000000000	28327c80-ae0e-45f6-87c9-c7e70648d2b6	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 17:47:21.440726+00	
00000000-0000-0000-0000-000000000000	83863aac-cc00-4cbe-8e03-2f2f1d2d2b75	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:47:27.74141+00	
00000000-0000-0000-0000-000000000000	6f11e6a1-c15d-43fc-8342-8fe1c709f447	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 17:52:26.419492+00	
00000000-0000-0000-0000-000000000000	f42d8af1-6631-4e17-91ef-f1f13f267932	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 18:22:13.734883+00	
00000000-0000-0000-0000-000000000000	28bad09e-b76c-47d9-9841-bb2ada375580	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 18:40:10.794295+00	
00000000-0000-0000-0000-000000000000	6f5bccee-9179-4e04-b402-05f8e8bd3057	{"action":"token_refreshed","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 19:38:30.724912+00	
00000000-0000-0000-0000-000000000000	2e6dee6c-45dd-4c10-ac54-4472b06d6422	{"action":"token_revoked","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 19:38:30.725532+00	
00000000-0000-0000-0000-000000000000	27d19a4a-ebf1-4089-be3e-a55d682894ec	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 19:41:49.201786+00	
00000000-0000-0000-0000-000000000000	972a4889-ca14-40fd-b7cc-423bd713b6a7	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 19:41:53.881794+00	
00000000-0000-0000-0000-000000000000	d6f721e4-1684-4ff7-a3c8-3969d3cbf303	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 19:57:01.024785+00	
00000000-0000-0000-0000-000000000000	789b53d1-1d0c-49fb-b737-eb2d421644dc	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 19:57:07.02942+00	
00000000-0000-0000-0000-000000000000	8ad98a90-cfad-40a0-81fb-4c6e0a75afe1	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 20:03:24.128786+00	
00000000-0000-0000-0000-000000000000	ebb0a893-c8ba-4f8a-90f0-ef5416a9506d	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 21:07:53.33329+00	
00000000-0000-0000-0000-000000000000	1276ef31-dafa-4f64-8561-c8b71c1d0e0a	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 21:07:57.684773+00	
00000000-0000-0000-0000-000000000000	2393acd2-fb3f-4a3b-babf-c90a2350d822	{"action":"token_refreshed","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 22:09:00.613102+00	
00000000-0000-0000-0000-000000000000	a018185a-1aef-47dd-9322-126241d0209a	{"action":"token_revoked","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 22:09:00.613804+00	
00000000-0000-0000-0000-000000000000	1b85f4c4-14a5-4481-840d-2776389c9bf8	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 22:39:45.030701+00	
00000000-0000-0000-0000-000000000000	0125dab6-28c9-4cbb-b27f-14adb3cb2837	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 22:43:58.810732+00	
00000000-0000-0000-0000-000000000000	f631712e-bf9b-41da-8643-3af3cff0de64	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 22:45:04.830768+00	
00000000-0000-0000-0000-000000000000	bc94a184-5085-48bd-a6a0-9953c0f6cba3	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 22:46:55.953868+00	
00000000-0000-0000-0000-000000000000	bd9a1580-25ed-48b6-9386-4addcab31697	{"action":"logout","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account"}	2025-05-28 23:14:44.525692+00	
00000000-0000-0000-0000-000000000000	f4feacf6-3396-4697-a516-75e536fe6215	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 23:22:27.723921+00	
00000000-0000-0000-0000-000000000000	529377fb-14e7-426d-b395-9b186fe0822f	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"joeldavidar@gmail.com","user_id":"ba1af47a-7a2d-4356-b570-edb0a0a64a4b","user_phone":""}}	2025-05-28 23:25:06.54811+00	
00000000-0000-0000-0000-000000000000	feee4561-7533-433e-9cae-b6f0f5df26d8	{"action":"token_refreshed","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-29 01:17:37.675729+00	
00000000-0000-0000-0000-000000000000	fa2e6c39-144e-43ad-a037-7aac0bce76ed	{"action":"token_revoked","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-29 01:17:37.676418+00	
00000000-0000-0000-0000-000000000000	78ec766d-2667-4f96-99ec-16de71261b4c	{"action":"token_refreshed","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-29 15:01:36.15034+00	
00000000-0000-0000-0000-000000000000	fd389c67-cf4b-44b6-ad72-3defd2715cc0	{"action":"token_revoked","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-29 15:01:36.151011+00	
00000000-0000-0000-0000-000000000000	49c14c56-15d3-4d2d-8d39-1ac5f4bf38e6	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-29 15:10:53.155995+00	
00000000-0000-0000-0000-000000000000	3b0b7c23-f1ed-44ba-b68e-0d902afe8d51	{"action":"token_refreshed","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-29 16:53:11.262322+00	
00000000-0000-0000-0000-000000000000	20d6d02e-31f1-4bf1-afdd-26e0e428ac6a	{"action":"token_revoked","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-05-29 16:53:11.262972+00	
00000000-0000-0000-0000-000000000000	e048436a-9130-498a-bcd4-38d1cce40b6f	{"action":"token_refreshed","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-06-03 12:43:48.251972+00	
00000000-0000-0000-0000-000000000000	7ccfaa41-4d51-4b4f-af97-fdf921da4dee	{"action":"token_revoked","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"token"}	2025-06-03 12:43:48.252591+00	
00000000-0000-0000-0000-000000000000	b67b9521-b513-4548-8b8d-4419055aa6bc	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 14:33:33.154318+00	
00000000-0000-0000-0000-000000000000	5b43339e-dd75-4b31-bf66-2634f5cc1295	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"kaande.app.pagos@gmail.com","user_id":"c57ce3ac-030c-4a49-a92a-8bc9074cb97e","user_phone":""}}	2025-06-03 14:56:18.739498+00	
00000000-0000-0000-0000-000000000000	9812b17f-bbd1-46c5-ba9a-061d3dd15e3e	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 15:03:56.561187+00	
00000000-0000-0000-0000-000000000000	9bbca8aa-778f-4e97-b302-9d8f074dca0d	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:08.015381+00	
00000000-0000-0000-0000-000000000000	9a49c97f-718a-403c-bb1b-3c72d4e1da86	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:09.877606+00	
00000000-0000-0000-0000-000000000000	930010f8-7976-4ea9-94d2-ce20cdec182e	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:12.07193+00	
00000000-0000-0000-0000-000000000000	f9b1d993-3480-42da-946c-b431bf9cbe89	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:13.611107+00	
00000000-0000-0000-0000-000000000000	a4e3e9c3-49ef-4171-bf33-2854f71c6112	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:15.721239+00	
00000000-0000-0000-0000-000000000000	e3b20fcb-3596-41f6-9438-a026f9d75a4b	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:15.974746+00	
00000000-0000-0000-0000-000000000000	e7825485-8037-4048-be8f-c7177610eeeb	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:17.978842+00	
00000000-0000-0000-0000-000000000000	a394d13d-e0f6-44de-adee-c3f0ec9ceed3	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:15:31.782806+00	
00000000-0000-0000-0000-000000000000	37d3fc52-f69f-47a5-8263-6d5c0bde352d	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 16:38:08.410034+00	
00000000-0000-0000-0000-000000000000	917a160f-738d-44ae-bfe8-45426143f9cd	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-03 18:11:08.621576+00	
00000000-0000-0000-0000-000000000000	e5b3d2f9-5604-4b46-ab4f-52216125ed05	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-04 01:07:42.642395+00	
00000000-0000-0000-0000-000000000000	9109255d-2e8d-412e-be8a-77b43f3f933a	{"action":"login","actor_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","actor_username":"admin@admin.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-04 01:15:03.3443+00	
00000000-0000-0000-0000-000000000000	680da998-360d-4ed9-9e6c-36b4491a6725	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"kaande.app.pagos@gmail.com","user_id":"c57ce3ac-030c-4a49-a92a-8bc9074cb97e","user_phone":""}}	2025-06-04 01:37:02.201823+00	
00000000-0000-0000-0000-000000000000	9923d38a-4173-4be4-aae5-76db186e4989	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"admin@gep.com.mx","user_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","user_phone":""}}	2025-06-04 01:37:12.332373+00	
00000000-0000-0000-0000-000000000000	28dd466b-d850-4381-903f-5514fa9d63d1	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"joeldavidar@gmail.com","user_id":"ba1af47a-7a2d-4356-b570-edb0a0a64a4b","user_phone":""}}	2025-06-04 01:37:18.877578+00	
00000000-0000-0000-0000-000000000000	36ce2b88-4486-4415-9b35-868b69f2a605	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"admin@admin.com","user_id":"9dfba574-a2b0-451e-b75d-6a7bd2870516","user_phone":""}}	2025-06-04 01:37:21.935321+00	
00000000-0000-0000-0000-000000000000	f00247b9-eea6-4a7e-b100-e21441fcdcca	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-07 18:36:15.448886+00	
00000000-0000-0000-0000-000000000000	8230ad45-b738-484f-a685-0e413779aea9	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-07 18:42:44.908794+00	
00000000-0000-0000-0000-000000000000	7b5d9568-6028-4f0d-900c-edc127ee2ed9	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 13:36:50.314166+00	
00000000-0000-0000-0000-000000000000	e9a2af0c-1fad-44ee-8649-0b792d2a06e6	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 16:05:49.013695+00	
00000000-0000-0000-0000-000000000000	bd9abadf-fe06-4eb5-87d3-f0a48db58568	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 18:54:20.523821+00	
00000000-0000-0000-0000-000000000000	13f756fe-eb18-4b80-b92b-702040ff0843	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 19:25:33.144553+00	
00000000-0000-0000-0000-000000000000	e4776128-66e7-426f-bce2-d2f667a4cfa7	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-09 19:26:29.227696+00	
00000000-0000-0000-0000-000000000000	313ff470-4f17-437f-9cd1-fb4502b411bd	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 19:30:47.524872+00	
00000000-0000-0000-0000-000000000000	b307e7e0-fdbd-4fa5-8a2b-a873cd77ea4b	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 20:55:52.872634+00	
00000000-0000-0000-0000-000000000000	eef96f06-e877-4d0c-a853-c23c2a231930	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-09 20:55:56.661496+00	
00000000-0000-0000-0000-000000000000	30660b2f-29f1-45e2-80a8-4c11837c2d54	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-09 21:05:49.630546+00	
00000000-0000-0000-0000-000000000000	23a87236-0807-43e8-ad2e-45e4118ad5a6	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-09 21:06:18.16779+00	
00000000-0000-0000-0000-000000000000	23b5a90a-42a3-455d-8fa5-9cacf648dd26	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 15:31:06.50133+00	
00000000-0000-0000-0000-000000000000	1f184883-d5fd-4998-b116-bc18655685a3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 16:29:42.250362+00	
00000000-0000-0000-0000-000000000000	a00edeeb-ce45-4e17-8188-7f8ad92caa07	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 16:29:42.250997+00	
00000000-0000-0000-0000-000000000000	7f9bd247-a8e8-4eaa-b1dc-e14efcfeea25	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 16:30:20.127836+00	
00000000-0000-0000-0000-000000000000	f93f92d5-04b3-4266-8cf6-5dfd10461fe5	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-10 16:30:25.777213+00	
00000000-0000-0000-0000-000000000000	220ec522-13a2-44c9-9185-0531e7b8e0d9	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 16:30:32.481062+00	
00000000-0000-0000-0000-000000000000	9eb6a9ae-2a77-4ffd-a02d-cac2737b2b45	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 16:35:51.004432+00	
00000000-0000-0000-0000-000000000000	e23453b4-4a3c-45f8-97a3-52e835944c12	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-10 16:56:10.131494+00	
00000000-0000-0000-0000-000000000000	5cfe4517-2d33-49b4-b288-c9c0b11f42d0	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 16:56:13.731056+00	
00000000-0000-0000-0000-000000000000	f3104b2a-0537-4421-aa51-8c95611de28c	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 17:54:47.924285+00	
00000000-0000-0000-0000-000000000000	4d02f064-1b01-4c3f-89ef-04c6e5bf7d3a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 17:54:47.924934+00	
00000000-0000-0000-0000-000000000000	48bfccdb-717b-45d1-ae32-ef623d9433bc	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 18:02:55.82366+00	
00000000-0000-0000-0000-000000000000	516c35df-c032-4e27-a506-165e7bb67e63	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 19:01:31.854682+00	
00000000-0000-0000-0000-000000000000	daa1e374-d6b4-4cd7-b26c-a1eb6ebc7721	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 19:01:31.855471+00	
00000000-0000-0000-0000-000000000000	08ea9bbf-9c33-4c71-a279-60514be5f90f	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 19:15:19.537892+00	
00000000-0000-0000-0000-000000000000	76ac32eb-e1a0-461a-bd88-d4d21bbc7f89	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 20:18:29.184495+00	
00000000-0000-0000-0000-000000000000	65e2abd6-7c69-48c4-b05a-da8733921b44	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 20:18:29.185103+00	
00000000-0000-0000-0000-000000000000	69e82b61-6507-497e-af0b-cd0e66656ba3	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 20:27:42.639921+00	
00000000-0000-0000-0000-000000000000	2f20488a-a058-403a-9f97-d14abd28f266	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 20:35:48.515879+00	
00000000-0000-0000-0000-000000000000	e3ec8ef3-3387-4e1d-9525-cf877e413fe9	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"joeldavidar@gep.com.mx","user_id":"c4a994d9-8d35-483b-a60e-a0eb0a10db6b","user_phone":""}}	2025-06-10 20:36:09.254425+00	
00000000-0000-0000-0000-000000000000	7b63c1b4-304c-44ab-9bfa-60f8dbfa341e	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-10 20:47:22.570781+00	
00000000-0000-0000-0000-000000000000	c4df3294-25d6-425d-9934-eee614204599	{"action":"login","actor_id":"c4a994d9-8d35-483b-a60e-a0eb0a10db6b","actor_username":"joeldavidar@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 20:47:27.172638+00	
00000000-0000-0000-0000-000000000000	703dbe81-506c-40ff-a06c-e5ac21c3650b	{"action":"logout","actor_id":"c4a994d9-8d35-483b-a60e-a0eb0a10db6b","actor_username":"joeldavidar@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-10 20:47:37.150029+00	
00000000-0000-0000-0000-000000000000	0657863b-8102-4a0a-943b-07860b99e229	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 20:47:47.078582+00	
00000000-0000-0000-0000-000000000000	c4f22915-bb29-41ef-9a7e-d38e8b382018	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 23:19:28.932858+00	
00000000-0000-0000-0000-000000000000	8ad20953-16c0-46bc-8ba0-2194ac4d5ea7	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-10 23:19:28.933448+00	
00000000-0000-0000-0000-000000000000	af446f40-0ac7-443a-950b-77873d6f80f4	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-10 23:33:50.729196+00	
00000000-0000-0000-0000-000000000000	5ac4abcc-83cb-410f-8405-d2c7d59a6b0d	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-11 13:29:01.85069+00	
00000000-0000-0000-0000-000000000000	df6f9004-52c2-4d7c-b92e-4ecec0870a37	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-11 13:29:01.851518+00	
00000000-0000-0000-0000-000000000000	84233d40-3f85-4ef3-a5e4-c6b252e7ecbf	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-11 15:14:40.351631+00	
00000000-0000-0000-0000-000000000000	3268fc53-d238-42c6-bf8c-74cd3a2b2258	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-11 17:24:59.208595+00	
00000000-0000-0000-0000-000000000000	fb5b38e2-ca50-4850-8d3e-6845e8d0cda4	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-11 23:30:44.087202+00	
00000000-0000-0000-0000-000000000000	771f042c-3258-4a3f-a9e6-de7c221db766	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-11 23:48:00.308474+00	
00000000-0000-0000-0000-000000000000	e829a176-16fb-4d8a-b254-2ba7e21cb4ff	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-11 23:51:34.11766+00	
00000000-0000-0000-0000-000000000000	22c14d4d-7cf5-4ab9-9fde-9be6e965c24c	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 14:45:59.594918+00	
00000000-0000-0000-0000-000000000000	ea47e8a9-6f58-473c-9d40-e69ae71e1c2e	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 14:45:59.595574+00	
00000000-0000-0000-0000-000000000000	dbf9433f-8f4d-4d27-ab0f-78fa6a7fe643	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 15:52:17.96362+00	
00000000-0000-0000-0000-000000000000	24a5e403-0931-4d08-b12e-5a4da3df263c	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 15:52:17.964405+00	
00000000-0000-0000-0000-000000000000	f3af1536-abb7-4482-8d81-0a2179c2d9a2	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 16:08:32.971729+00	
00000000-0000-0000-0000-000000000000	3f8a1f0c-8d3d-4b13-98c0-1bff92a3163b	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-12 16:08:47.084566+00	
00000000-0000-0000-0000-000000000000	a665350c-ea82-49bb-8a99-013169e3949e	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 16:09:10.697555+00	
00000000-0000-0000-0000-000000000000	4692559e-2fa3-4622-bc25-197fc667d37d	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 16:21:04.010172+00	
00000000-0000-0000-0000-000000000000	234a040e-fc66-4e53-828b-22150c01eb16	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 18:06:48.943417+00	
00000000-0000-0000-0000-000000000000	205ebd25-2af4-429a-b68d-df2e0392f50f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 18:06:48.944102+00	
00000000-0000-0000-0000-000000000000	189745a5-c2e8-402b-99c8-b22d87852660	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 18:22:32.2779+00	
00000000-0000-0000-0000-000000000000	1933646a-1cd9-4e75-bbfc-09f00ef7759f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 18:22:32.279397+00	
00000000-0000-0000-0000-000000000000	ee75a788-6ef6-40c4-873b-e2782225da50	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 19:24:53.70368+00	
00000000-0000-0000-0000-000000000000	80987e8c-929d-4f3f-ac66-b5362981aecf	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-12 19:24:58.577926+00	
00000000-0000-0000-0000-000000000000	b4659505-1180-4bc5-ad87-ada0783727a8	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 19:48:03.534689+00	
00000000-0000-0000-0000-000000000000	8c8cc410-a571-4785-9796-15431b425bc9	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-12 19:48:57.154696+00	
00000000-0000-0000-0000-000000000000	aadb8671-5a30-4c88-a876-d8bdc6c3282e	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 19:52:48.666189+00	
00000000-0000-0000-0000-000000000000	7f0cf411-b408-4e08-a671-a407cd40729d	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-12 19:58:03.944473+00	
00000000-0000-0000-0000-000000000000	6e219ad6-37e8-4779-850c-cadb1bdf3ebe	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 21:04:58.615651+00	
00000000-0000-0000-0000-000000000000	d34faf4e-9e29-4cc8-85e9-4cc874202507	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 21:04:58.616544+00	
00000000-0000-0000-0000-000000000000	b5e709c8-a1ab-4577-903d-a3a565f5e25f	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 23:49:37.496623+00	
00000000-0000-0000-0000-000000000000	0cae93f6-82f6-4290-9ee3-5a4f4d4acd72	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-12 23:49:37.49731+00	
00000000-0000-0000-0000-000000000000	7459b4ea-01c1-4965-909f-2a514da036bc	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-12 23:49:45.296856+00	
00000000-0000-0000-0000-000000000000	2705eb02-b7e6-48b5-a07b-9e7fd5c131fa	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 00:02:02.91889+00	
00000000-0000-0000-0000-000000000000	7ca64093-7ed9-4232-a007-439123bff324	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-13 00:11:46.885067+00	
00000000-0000-0000-0000-000000000000	3448cd5b-bc86-48ff-9541-eed276747ebb	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-16 16:36:57.144242+00	
00000000-0000-0000-0000-000000000000	ca54b395-6cab-4099-af7b-39fc4313a079	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-16 16:41:21.146179+00	
00000000-0000-0000-0000-000000000000	c204f0ab-a3b5-445d-b6bf-648717fc23e7	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 17:38:11.711241+00	
00000000-0000-0000-0000-000000000000	01bf791d-06d2-455b-a394-053df34eb0cf	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 17:38:11.711795+00	
00000000-0000-0000-0000-000000000000	bda0372a-0755-433c-bc5b-fe02f9f723ba	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 18:39:12.75651+00	
00000000-0000-0000-0000-000000000000	f6964b60-7ccf-405d-88e8-ef5beb2972dc	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 18:39:12.757351+00	
00000000-0000-0000-0000-000000000000	027613a1-06b2-4a93-9793-188644b1d92b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 19:39:12.575018+00	
00000000-0000-0000-0000-000000000000	940c5c9a-5ed8-40d2-ad2a-a25338f3e179	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 19:39:12.575792+00	
00000000-0000-0000-0000-000000000000	d141e6b2-8c39-400c-8689-c51be29f13fb	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 20:39:12.501173+00	
00000000-0000-0000-0000-000000000000	f19aba43-ec59-4211-b27f-1b974aef6e1a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 20:39:12.501976+00	
00000000-0000-0000-0000-000000000000	a98e672e-1de4-4611-a546-208f01c5b594	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 21:59:12.269001+00	
00000000-0000-0000-0000-000000000000	1deee6b7-c9d0-46d6-9dc6-df86281fe812	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-16 21:59:12.270129+00	
00000000-0000-0000-0000-000000000000	92812648-7b68-4f34-b8b8-8025d0d3a649	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-17 03:15:08.771815+00	
00000000-0000-0000-0000-000000000000	754ad1cc-945f-4c75-9737-2c1452384d97	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-17 19:30:11.628397+00	
00000000-0000-0000-0000-000000000000	54877fdb-6dda-4615-92fd-64e3e75b83e2	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-17 19:30:11.629071+00	
00000000-0000-0000-0000-000000000000	cdb83858-e126-4808-8ce2-8bc1f652c6f3	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-17 19:55:51.224047+00	
00000000-0000-0000-0000-000000000000	15075e3e-a0d0-4f89-a8a6-3d6edfa3d973	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-17 20:28:47.34342+00	
00000000-0000-0000-0000-000000000000	8dcca7d6-e72f-4488-b597-8660f61b7886	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-17 20:28:56.213798+00	
00000000-0000-0000-0000-000000000000	2106c408-2cf5-4ced-ae70-9f7f0153722b	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-18 15:51:36.025824+00	
00000000-0000-0000-0000-000000000000	27fc0c77-26cf-4ac3-9534-3a352c906df8	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-18 15:59:30.238622+00	
00000000-0000-0000-0000-000000000000	fc645f5d-808c-4e55-9c02-d04396178fba	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-18 15:59:30.239627+00	
00000000-0000-0000-0000-000000000000	a36254c7-6213-49d3-9751-ffecd0ddb31d	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-18 16:01:09.535013+00	
00000000-0000-0000-0000-000000000000	fdfe84ee-c750-4e83-913c-0f0601d1347e	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-18 16:01:21.791206+00	
00000000-0000-0000-0000-000000000000	13968e92-1ab9-44a8-a20b-89d3b02246a4	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-18 16:01:41.144785+00	
00000000-0000-0000-0000-000000000000	7e90a920-72b7-487a-bf4d-1fd5ec333c2b	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-18 16:36:06.114264+00	
00000000-0000-0000-0000-000000000000	ee745071-3b28-46c8-9f50-84c1682c1881	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-18 17:34:33.081659+00	
00000000-0000-0000-0000-000000000000	65676fc0-d096-4c4f-a8b3-d3b79d008cf3	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-18 17:34:33.082463+00	
00000000-0000-0000-0000-000000000000	fabd1138-7e09-40bd-b6b1-b9794ea9dd3d	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-18 17:55:58.921265+00	
00000000-0000-0000-0000-000000000000	4bab21e3-166b-4ed9-9ab0-0e3dd5505e5b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-18 18:38:44.085894+00	
00000000-0000-0000-0000-000000000000	afa275d5-1c14-4729-ae7a-28562fc7d465	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-18 18:38:44.086539+00	
00000000-0000-0000-0000-000000000000	072ddee8-80df-413b-a1de-f578677f9f46	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-19 16:08:48.410214+00	
00000000-0000-0000-0000-000000000000	1481aea6-e8b1-4c30-8df2-503cca0a7663	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-19 16:08:48.410891+00	
00000000-0000-0000-0000-000000000000	896765b6-3c80-4df0-9780-cf23c80e2777	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-19 16:08:51.907307+00	
00000000-0000-0000-0000-000000000000	7419fe46-04a7-4daa-b83b-1509061740d7	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-19 16:09:35.182799+00	
00000000-0000-0000-0000-000000000000	add2498a-abab-482e-8e58-6368ed4105cc	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-19 18:30:08.580311+00	
00000000-0000-0000-0000-000000000000	adb0e709-f362-4917-80a8-9ce372d51ee1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-19 18:30:08.58086+00	
00000000-0000-0000-0000-000000000000	cc4a1eda-463e-441d-be60-fd8bc92c473b	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-19 18:37:40.812153+00	
00000000-0000-0000-0000-000000000000	1b1dcedf-8faa-497c-a373-a98faf881dc6	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-19 19:10:49.819554+00	
00000000-0000-0000-0000-000000000000	c124ad29-35d6-4c6c-ac1d-e4884cd0425b	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-23 19:49:52.230016+00	
00000000-0000-0000-0000-000000000000	d2445906-ec54-42ce-901d-2827d6f9f40d	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-23 20:00:24.09777+00	
00000000-0000-0000-0000-000000000000	ea794ffc-14f7-4636-921d-2d7bb8b203d0	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-23 20:08:24.765078+00	
00000000-0000-0000-0000-000000000000	0cd58b1b-94a7-462f-9228-d8f6777a806d	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-23 21:06:35.937839+00	
00000000-0000-0000-0000-000000000000	67572a19-fa0e-41ea-8079-77b76b207a31	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-23 21:06:35.938443+00	
00000000-0000-0000-0000-000000000000	01b4de36-3fd5-41ef-8d60-c56ff53e2b83	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-23 21:35:58.662131+00	
00000000-0000-0000-0000-000000000000	3891f8dc-098b-46ea-b0b1-4cd71ec864f6	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-26 19:09:15.188327+00	
00000000-0000-0000-0000-000000000000	750173e0-ed9e-421f-bd4b-2ee7f9c7e344	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-26 19:09:15.188926+00	
00000000-0000-0000-0000-000000000000	b3df4237-89fa-4fc9-906a-1a556ebb8151	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-06-26 19:12:12.951088+00	
00000000-0000-0000-0000-000000000000	073f6086-0a86-4cb9-8f81-c1750aec9c2f	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-30 20:06:19.432158+00	
00000000-0000-0000-0000-000000000000	8a7d6c6d-0afc-43ee-a483-da46f7883fcd	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-30 20:13:29.929327+00	
00000000-0000-0000-0000-000000000000	301b0825-11df-4d8e-9086-f72d622f782d	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-30 21:07:24.165583+00	
00000000-0000-0000-0000-000000000000	fdb119fd-271c-442e-a29a-859cc76e44e7	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-30 21:07:24.16616+00	
00000000-0000-0000-0000-000000000000	75ca2a76-a714-40c8-b0ff-93a8f76fadaa	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-30 22:06:13.562423+00	
00000000-0000-0000-0000-000000000000	5bddc518-6548-4548-a437-7593ab8db8f6	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-06-30 22:06:13.562998+00	
00000000-0000-0000-0000-000000000000	de78ee0c-72fb-4305-8e58-bf9735dedaba	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 03:16:45.28545+00	
00000000-0000-0000-0000-000000000000	9f21dc27-0bb1-42ce-8535-a9a33e9e98e9	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 03:16:45.28607+00	
00000000-0000-0000-0000-000000000000	ca12850b-7458-4ef3-9164-64eb84be8c80	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 15:34:14.9453+00	
00000000-0000-0000-0000-000000000000	a4dacd60-9366-4adc-91d1-24db3f630f18	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 15:34:14.946087+00	
00000000-0000-0000-0000-000000000000	8ef8bfff-a3a7-4229-8402-751ff235ee21	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 16:34:50.074403+00	
00000000-0000-0000-0000-000000000000	5afbeecb-6206-4d15-a6ae-fef7562f4ccc	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 16:34:50.075008+00	
00000000-0000-0000-0000-000000000000	033a3867-a5bb-4b9d-a72f-60772ba6f1f5	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-01 18:06:19.949364+00	
00000000-0000-0000-0000-000000000000	f5140cf9-7b63-4102-86c6-55b13108bea5	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 19:07:59.294576+00	
00000000-0000-0000-0000-000000000000	62bf3377-82c7-4a4b-96e5-38826cabd198	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 19:07:59.29526+00	
00000000-0000-0000-0000-000000000000	dea360db-0d2b-4de4-ad7b-599bd5a88bd6	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 20:08:11.246045+00	
00000000-0000-0000-0000-000000000000	bd061e1a-feb6-410e-9fc5-77b9f9eff2c0	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 20:08:11.247065+00	
00000000-0000-0000-0000-000000000000	af9bc036-2b6e-4372-9547-82ce5f78bc61	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 20:31:31.291576+00	
00000000-0000-0000-0000-000000000000	6967e46a-1f0f-489d-a8be-8a3b265538d1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 20:31:31.292253+00	
00000000-0000-0000-0000-000000000000	33b26c80-195b-44a6-95f0-b26cd44b75fb	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 21:06:24.32688+00	
00000000-0000-0000-0000-000000000000	e90c83b0-c158-402e-bdff-72290254e0ab	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 21:06:24.327498+00	
00000000-0000-0000-0000-000000000000	34d42d34-19cd-47df-8f5b-29d84d0dc809	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 22:04:25.707798+00	
00000000-0000-0000-0000-000000000000	1ac534b8-95b0-4128-b236-9888daac20ee	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 22:04:25.708774+00	
00000000-0000-0000-0000-000000000000	ff300a08-1247-42d3-bb7d-f50becda912b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 22:28:13.917396+00	
00000000-0000-0000-0000-000000000000	f60dc67f-abf2-4fd5-9d48-5e899ad3213b	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 22:28:13.9181+00	
00000000-0000-0000-0000-000000000000	b1c3c858-2857-4ffe-ae75-2cb5d32dc75f	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-01 23:10:29.967586+00	
00000000-0000-0000-0000-000000000000	d3592c28-36d4-463c-b10a-efd89a3737dd	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 23:14:09.152895+00	
00000000-0000-0000-0000-000000000000	728981d8-e400-489c-9770-5ded4ea6b89d	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-01 23:14:09.153716+00	
00000000-0000-0000-0000-000000000000	8dd9b964-3cbc-4202-92ce-c981dc6209d9	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 15:20:05.91196+00	
00000000-0000-0000-0000-000000000000	9fb79e95-02bc-45c4-a8d6-22f7d6b208e2	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 15:20:05.912769+00	
00000000-0000-0000-0000-000000000000	73ae6964-4172-4d8d-914b-a36d14bace41	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 22:04:56.499342+00	
00000000-0000-0000-0000-000000000000	9a9701a3-3e3e-4723-9ce7-987c037897b1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 22:04:56.500006+00	
00000000-0000-0000-0000-000000000000	d6e462b7-0cea-4788-a939-371ada900d30	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 22:09:51.809199+00	
00000000-0000-0000-0000-000000000000	871ed3bb-2059-44cc-a149-3f1c2f90c52f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 22:09:51.809849+00	
00000000-0000-0000-0000-000000000000	2788d273-7787-4bd3-9d5a-5dd8139d340e	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 23:28:42.500927+00	
00000000-0000-0000-0000-000000000000	fb84a2a4-0715-4204-95c6-833c45bc7980	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-02 23:28:42.501568+00	
00000000-0000-0000-0000-000000000000	e938088e-8352-4380-8abc-37df7fc86774	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-03 19:06:03.036563+00	
00000000-0000-0000-0000-000000000000	6da5998d-7dd3-43bb-b2f3-8a4453daa308	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-03 19:06:51.563204+00	
00000000-0000-0000-0000-000000000000	c8c758b9-865e-422c-9418-09ec97e0a6d0	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-03 19:06:51.563738+00	
00000000-0000-0000-0000-000000000000	49c1bbbb-1520-422f-be6e-b9245f57765c	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-04 15:16:30.390485+00	
00000000-0000-0000-0000-000000000000	139ae0a9-e304-4c8f-bff4-72e2261bdcae	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-04 15:16:30.391053+00	
00000000-0000-0000-0000-000000000000	4f355460-1b94-45c3-a794-e4f53f868dc5	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-04 20:31:51.805789+00	
00000000-0000-0000-0000-000000000000	ee36cb28-bfa1-467a-a02a-12ce6a15f615	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-04 20:31:51.806488+00	
00000000-0000-0000-0000-000000000000	345d9ea1-9c94-4bd8-89e8-5a058d59c1f3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-04 21:39:41.781655+00	
00000000-0000-0000-0000-000000000000	7c61c0ba-624f-40d1-a7ea-eaf42d75404e	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-04 21:39:41.782446+00	
00000000-0000-0000-0000-000000000000	14706157-980c-4379-b713-971f855d13ac	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-08 23:17:52.143052+00	
00000000-0000-0000-0000-000000000000	0be38398-63d2-47db-b684-ca6b2d03c711	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-08 23:17:52.143891+00	
00000000-0000-0000-0000-000000000000	18a77301-aa9b-419d-8cb5-42189b0a31f2	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-09 14:48:35.685608+00	
00000000-0000-0000-0000-000000000000	288b330c-dafe-4e42-843c-bc3bff99e940	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-09 14:48:35.686278+00	
00000000-0000-0000-0000-000000000000	510a3a3c-843a-45e9-a553-af82cd50b329	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-09 16:42:06.521067+00	
00000000-0000-0000-0000-000000000000	f9593b80-d9af-46d7-bd68-370bf9285f10	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-09 16:42:06.521817+00	
00000000-0000-0000-0000-000000000000	aa8c1c10-f64e-49a7-a6ab-7e1e464cb499	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-09 23:29:14.253618+00	
00000000-0000-0000-0000-000000000000	d71b7d91-c2f8-4689-9183-cbf999cad0d4	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-09 23:29:14.254307+00	
00000000-0000-0000-0000-000000000000	beaea386-382c-4e05-8eaa-d2f899724c1f	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-10 15:13:54.703003+00	
00000000-0000-0000-0000-000000000000	aa3ac4a1-ea91-4c80-9c39-98fa62391bae	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-10 15:13:54.703993+00	
00000000-0000-0000-0000-000000000000	08b8e94d-9099-410d-8bda-d6189e50a81b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-11 00:20:17.15288+00	
00000000-0000-0000-0000-000000000000	15d1984c-6f13-4205-9ea1-e7e60fad5d52	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-11 00:20:17.153617+00	
00000000-0000-0000-0000-000000000000	1e7e034b-95a8-4e33-aef8-d929fc97b347	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-14 15:33:55.886869+00	
00000000-0000-0000-0000-000000000000	f4f30d51-0a79-42d7-9b49-6a042423f7bd	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-14 15:33:55.887591+00	
00000000-0000-0000-0000-000000000000	3122e93f-cbbe-484e-8ea0-c479c52c1b86	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 19:02:00.884642+00	
00000000-0000-0000-0000-000000000000	3093e069-b154-45e4-a0ae-f76c52948bc4	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 19:02:00.885332+00	
00000000-0000-0000-0000-000000000000	8bc035dc-0356-4d90-ac9f-02774c838e03	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 19:02:09.401073+00	
00000000-0000-0000-0000-000000000000	4c37f326-2f21-4e67-bf30-e02b2cbcf022	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 19:02:09.401393+00	
00000000-0000-0000-0000-000000000000	500d62e8-afc5-4671-83d5-86e103b4a2e9	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-15 19:02:10.53622+00	
00000000-0000-0000-0000-000000000000	644f2e89-0cb6-4716-86f7-a91b77851f92	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-15 19:02:14.121777+00	
00000000-0000-0000-0000-000000000000	0a4df23f-c5e9-40ea-bed9-9d77926ed3a0	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-15 19:19:08.643671+00	
00000000-0000-0000-0000-000000000000	68081efa-c37c-4e32-8e75-fb68fbf71f49	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-15 20:44:35.801352+00	
00000000-0000-0000-0000-000000000000	47204297-2239-4095-9d6d-b934c0bc6b7d	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 20:51:40.06204+00	
00000000-0000-0000-0000-000000000000	88d2a737-ca8e-4410-82a7-9e184f215603	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 20:51:40.062659+00	
00000000-0000-0000-0000-000000000000	fff6477c-59cf-425d-876c-b6c990e5edc6	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-15 20:55:19.852373+00	
00000000-0000-0000-0000-000000000000	8e553da3-ba98-4ad6-b0e6-b97c8829a666	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 21:00:53.996477+00	
00000000-0000-0000-0000-000000000000	5ffe10c1-aa9e-4639-a513-f267c803eb46	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 21:00:53.99706+00	
00000000-0000-0000-0000-000000000000	ea13264c-184b-4e54-a516-f003771f15f7	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-15 21:41:51.091457+00	
00000000-0000-0000-0000-000000000000	0af59002-7cf1-4c55-8198-34dfab9fd5dc	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 23:06:40.020333+00	
00000000-0000-0000-0000-000000000000	0348e252-353e-44da-b546-6b3e987daa9a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 23:06:40.021016+00	
00000000-0000-0000-0000-000000000000	f81d7338-43f5-4e97-b7ce-8b59220edc0f	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 23:59:09.097373+00	
00000000-0000-0000-0000-000000000000	d4d08492-d152-4683-a305-1174771a80e0	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-15 23:59:09.098045+00	
00000000-0000-0000-0000-000000000000	b8acb80e-c71d-4f8c-bd1d-d1c774de96da	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 16:00:19.002298+00	
00000000-0000-0000-0000-000000000000	da2d89e7-34b3-4665-b56d-c981c94a8bf5	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 16:00:19.002901+00	
00000000-0000-0000-0000-000000000000	e7c18aaa-cb5f-4ae0-9358-36cb8eb1fc78	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 17:00:19.91931+00	
00000000-0000-0000-0000-000000000000	38e96716-fe6d-42a3-8049-14496d071836	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 17:00:19.920089+00	
00000000-0000-0000-0000-000000000000	b4e68403-9235-42a9-8333-c08212ff14ee	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 21:06:42.68182+00	
00000000-0000-0000-0000-000000000000	3fdd2dbc-2350-4ccf-8c54-7db0de8c431c	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 21:06:42.682407+00	
00000000-0000-0000-0000-000000000000	fe414d08-a82c-4c28-8284-548fb097e154	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 22:44:51.093043+00	
00000000-0000-0000-0000-000000000000	7523f62f-7761-4da7-a133-74e2ac85e212	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-16 22:44:51.093655+00	
00000000-0000-0000-0000-000000000000	9cb46cfb-1550-4491-b826-6cf9ca1ce1af	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-16 22:49:08.667585+00	
00000000-0000-0000-0000-000000000000	2bd52f7d-e8d0-438c-a372-feca3ead16b2	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-16 22:49:39.993478+00	
00000000-0000-0000-0000-000000000000	9c676ccc-253d-4f25-a98e-35d5110f5b38	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-17 15:14:06.379981+00	
00000000-0000-0000-0000-000000000000	caa34baf-42f4-4a4d-960d-122579517993	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 16:28:56.434508+00	
00000000-0000-0000-0000-000000000000	2a669b21-45c0-4003-b07b-5507b921a401	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 16:28:56.435198+00	
00000000-0000-0000-0000-000000000000	ec22a936-f9ea-487f-9108-ee9b5fff8c70	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-17 16:30:36.315409+00	
00000000-0000-0000-0000-000000000000	4935f106-2dd2-4012-adc3-1c54073d9f7d	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-17 16:30:46.23806+00	
00000000-0000-0000-0000-000000000000	2513ecb2-f9a7-4304-b9c2-0e8ef138129a	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-17 16:30:49.367592+00	
00000000-0000-0000-0000-000000000000	310f2371-4b59-4533-a4e9-4e41aef194e3	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-17 16:31:58.155599+00	
00000000-0000-0000-0000-000000000000	46ae4972-08a2-4210-a13a-ee9136682264	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 17:30:07.549936+00	
00000000-0000-0000-0000-000000000000	7b17d37c-80c8-4a03-b182-2ddf33990d26	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 17:30:07.550563+00	
00000000-0000-0000-0000-000000000000	a7e4f493-424a-44fe-aac9-a83861c958d1	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 18:28:28.056362+00	
00000000-0000-0000-0000-000000000000	2e446e1b-9e00-493b-b6da-520b50925177	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 18:28:28.056967+00	
00000000-0000-0000-0000-000000000000	68dded14-f40c-428b-8835-c6f812002e2a	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 20:13:08.236692+00	
00000000-0000-0000-0000-000000000000	a3b2a61c-e0f8-46cd-b668-6d02e30fd21c	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 20:13:08.23737+00	
00000000-0000-0000-0000-000000000000	650ce814-70b8-46d7-8214-2dc5e9fabf81	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-17 20:16:43.754086+00	
00000000-0000-0000-0000-000000000000	74d9f608-5e63-46e9-821e-2a0a2d349c27	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 21:16:27.824543+00	
00000000-0000-0000-0000-000000000000	5d6b7c89-a4f7-46d2-9ef0-4a24ecc1d4d5	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 21:16:27.825148+00	
00000000-0000-0000-0000-000000000000	b7c6c065-f4ba-4e70-bb6c-a0ae80d283c6	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-17 22:29:19.923502+00	
00000000-0000-0000-0000-000000000000	0fc38a78-6d3d-43d3-b5f2-6be6420c62a5	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 23:08:39.18213+00	
00000000-0000-0000-0000-000000000000	67ab751d-f3d3-46a8-b3fb-8973b47dab9f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-17 23:08:39.182866+00	
00000000-0000-0000-0000-000000000000	db6cf678-d203-4e34-ad07-a8fa9daf7429	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 00:06:43.832291+00	
00000000-0000-0000-0000-000000000000	3c8a0534-534f-45ef-9a88-fdc5a6a481a7	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 00:06:43.832914+00	
00000000-0000-0000-0000-000000000000	461e61c9-3b82-4a08-b17b-bb0066643934	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 15:13:21.906161+00	
00000000-0000-0000-0000-000000000000	e4b3024c-c51d-4545-ae8c-4179fb917160	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 15:13:21.906896+00	
00000000-0000-0000-0000-000000000000	5e2367df-1c1e-41b9-8c5e-b8c4bb0462b6	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 15:14:45.01744+00	
00000000-0000-0000-0000-000000000000	e12a5021-e958-49ab-b4af-7ff3c7c12643	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 15:14:45.018172+00	
00000000-0000-0000-0000-000000000000	3aa40b68-875c-493b-9a43-b9ccdad293a0	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 16:22:58.585372+00	
00000000-0000-0000-0000-000000000000	0853ce15-516d-400f-8e05-0e62b7d39711	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 16:22:58.58594+00	
00000000-0000-0000-0000-000000000000	4b817b8f-a185-46ee-8172-0aa733d5b6e6	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 17:53:18.409427+00	
00000000-0000-0000-0000-000000000000	a5f87b03-1381-45b7-9576-5c1882da045a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 17:53:18.410062+00	
00000000-0000-0000-0000-000000000000	5d70f5fc-606e-4ca2-806b-1a2b419d102b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 20:44:40.750938+00	
00000000-0000-0000-0000-000000000000	d7905c40-fea3-4220-948e-c3fa7937c689	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 20:44:40.751668+00	
00000000-0000-0000-0000-000000000000	382a4a54-afd5-4a87-9c56-06e3e81939e2	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 23:44:09.569811+00	
00000000-0000-0000-0000-000000000000	3719c4e0-0179-4fa6-8826-a02f38478e18	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-18 23:44:09.570431+00	
00000000-0000-0000-0000-000000000000	600d14a4-bcbe-4e0b-b8cc-ec95753bfd41	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-21 17:32:52.489241+00	
00000000-0000-0000-0000-000000000000	d322f41f-8a94-4975-9bf1-5b556e53153f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-21 17:32:52.489968+00	
00000000-0000-0000-0000-000000000000	191c0350-50f1-4135-92c7-a6bc116a59a5	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 14:00:08.032289+00	
00000000-0000-0000-0000-000000000000	f74eb2c7-53d5-4b92-81b3-4e77657e08cb	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 14:00:08.032994+00	
00000000-0000-0000-0000-000000000000	de751a2c-ebc9-48fe-9666-7a47763653bb	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 17:34:09.842302+00	
00000000-0000-0000-0000-000000000000	d1f5e262-a2d7-4911-a3ee-cc6219e51900	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 17:34:09.843041+00	
00000000-0000-0000-0000-000000000000	58b99ed7-ff1c-4269-b081-de1f0af2d78e	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 18:26:24.45361+00	
00000000-0000-0000-0000-000000000000	9135b906-16d5-47bb-870c-60c3e007fa0f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 18:26:24.454277+00	
00000000-0000-0000-0000-000000000000	cc41ee55-22c4-4cb1-9eeb-c7cd64a1acb3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 18:31:18.792152+00	
00000000-0000-0000-0000-000000000000	17e07895-6da2-4c8e-8d7c-58afc2f53b91	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 18:31:18.793166+00	
00000000-0000-0000-0000-000000000000	39b6e15c-5ce7-4622-9ce3-87d03a6214f4	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 18:34:57.500305+00	
00000000-0000-0000-0000-000000000000	264862cb-48f5-4b0e-9e88-6bdbe7bf948c	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-22 18:34:57.501354+00	
00000000-0000-0000-0000-000000000000	d968c7f1-4f56-4126-b468-06dd9fd0c08f	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 15:55:45.197559+00	
00000000-0000-0000-0000-000000000000	1f5364f4-0570-4365-8a85-d6f37397a2ee	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 15:55:45.198197+00	
00000000-0000-0000-0000-000000000000	c82d4aa3-36e8-45aa-b1c1-6b9a6bf2fdc5	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-23 16:22:58.902063+00	
00000000-0000-0000-0000-000000000000	b4c7b0b4-0c05-4425-b487-ca4fee2ee7c3	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 16:23:02.768981+00	
00000000-0000-0000-0000-000000000000	f709c4b4-05da-4169-889f-ab0a2cfee8c2	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 16:49:10.631585+00	
00000000-0000-0000-0000-000000000000	5d48a751-c6c5-4d5d-9614-d369a5d2ef6f	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 16:52:17.96924+00	
00000000-0000-0000-0000-000000000000	d18f9969-0b1a-4624-9a88-2a7496dbec23	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 18:44:54.247066+00	
00000000-0000-0000-0000-000000000000	19503b9b-6a86-4435-a5ae-1280e45e34e8	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 18:44:54.247825+00	
00000000-0000-0000-0000-000000000000	404e8d1f-2d89-4695-a948-52ef95bb523c	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 19:31:17.300399+00	
00000000-0000-0000-0000-000000000000	bae64831-1169-4526-a334-adfc9a3b3ba9	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 19:42:54.041974+00	
00000000-0000-0000-0000-000000000000	d8a22b33-77f4-4ac5-96c0-b40e1a9dc2d1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 19:42:54.042577+00	
00000000-0000-0000-0000-000000000000	876e2753-e3e5-489f-b963-f252ea98b692	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"cmorales@gep.com.mx","user_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","user_phone":""}}	2025-07-23 19:43:37.964884+00	
00000000-0000-0000-0000-000000000000	763ba942-f148-48f5-80dd-a904c5fea89d	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-23 19:43:48.706906+00	
00000000-0000-0000-0000-000000000000	b9b4d356-9ab2-4d2a-9077-9c4c3ce9890a	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 19:44:02.935348+00	
00000000-0000-0000-0000-000000000000	9b463101-d2c2-4e38-bf6f-9e398eea09a1	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 20:48:49.813003+00	
00000000-0000-0000-0000-000000000000	ce294337-7772-438b-bd54-52944773a39f	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 20:49:20.309362+00	
00000000-0000-0000-0000-000000000000	806d38a9-ede2-4936-8bee-19d87ed17b5e	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 20:49:20.309778+00	
00000000-0000-0000-0000-000000000000	84c8bc8f-5f76-403f-bc8f-49ee13405201	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 21:47:38.606968+00	
00000000-0000-0000-0000-000000000000	9050b4b5-5e44-4bf3-918d-cf2de411a3c4	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 21:47:38.607711+00	
00000000-0000-0000-0000-000000000000	469a16c4-5921-418d-94da-c2580f35874a	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 21:52:32.93318+00	
00000000-0000-0000-0000-000000000000	3d17693c-5df8-4609-b9ca-8124560705fd	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 21:52:32.93386+00	
00000000-0000-0000-0000-000000000000	09226391-3082-4793-9059-5ac631cb48d6	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 22:31:03.106019+00	
00000000-0000-0000-0000-000000000000	89e02bd2-f627-4f37-aaf6-4e63a66b5e13	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 22:45:55.136683+00	
00000000-0000-0000-0000-000000000000	210a53ac-b803-4a81-bbaf-3028141da4fa	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 22:45:55.137426+00	
00000000-0000-0000-0000-000000000000	c39cbe0f-fb6d-496f-8134-4cba3589375f	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 23:29:06.510695+00	
00000000-0000-0000-0000-000000000000	a3e7ce1b-b1ba-4b68-b981-0fb0d217c9db	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-23 23:29:06.511355+00	
00000000-0000-0000-0000-000000000000	440f4a41-6b4f-439a-af07-7cb6fc0908b3	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"victorc@gep.com.mx","user_id":"7b8b124e-b43a-4680-920e-a42047702501","user_phone":""}}	2025-07-23 23:35:27.644037+00	
00000000-0000-0000-0000-000000000000	1057b7ac-9443-41ca-9b21-36d89e7e4f1a	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-23 23:35:38.655235+00	
00000000-0000-0000-0000-000000000000	6e65d2fd-cdcd-4893-9507-f1e059a10b92	{"action":"login","actor_id":"7b8b124e-b43a-4680-920e-a42047702501","actor_username":"victorc@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 23:35:53.784047+00	
00000000-0000-0000-0000-000000000000	68351e6d-e0d9-4b55-8439-6f2cd5ec9831	{"action":"logout","actor_id":"7b8b124e-b43a-4680-920e-a42047702501","actor_username":"victorc@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-23 23:44:01.110518+00	
00000000-0000-0000-0000-000000000000	8947be56-6ead-4bc6-be20-95e4f263b423	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 23:44:12.327638+00	
00000000-0000-0000-0000-000000000000	3649f036-5320-45c2-a82a-b24b739e577d	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-23 23:44:35.688731+00	
00000000-0000-0000-0000-000000000000	e98b7261-f751-4cde-b070-729bea4b1885	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-23 23:44:47.070882+00	
00000000-0000-0000-0000-000000000000	0ad17354-0b14-4403-888f-04e47a691030	{"action":"login","actor_id":"7b8b124e-b43a-4680-920e-a42047702501","actor_username":"victorc@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-24 00:26:56.337275+00	
00000000-0000-0000-0000-000000000000	f1150839-c6a1-4223-ad2e-1058e1eb4224	{"action":"logout","actor_id":"7b8b124e-b43a-4680-920e-a42047702501","actor_username":"victorc@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-24 00:27:14.901799+00	
00000000-0000-0000-0000-000000000000	00cdccde-9b1f-4820-8322-67a22b6a6fc1	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 01:40:10.074589+00	
00000000-0000-0000-0000-000000000000	745b0fb5-a9d9-4cdb-abc8-0819e5955453	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 01:40:10.075221+00	
00000000-0000-0000-0000-000000000000	68940b5c-3deb-43d8-bfda-30ddbd5f85f3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 14:45:40.130997+00	
00000000-0000-0000-0000-000000000000	5248b8b1-811a-41f9-a129-2852a434081e	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 14:45:40.131666+00	
00000000-0000-0000-0000-000000000000	7e0d4d72-1491-4ac9-aa3a-7cccda5c43d0	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 15:45:21.889167+00	
00000000-0000-0000-0000-000000000000	d785f0d1-a3af-4c5e-a271-8c406e395992	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 15:45:21.889733+00	
00000000-0000-0000-0000-000000000000	684a9b73-688d-45c5-81a1-a6b1ce4737e9	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 17:31:13.183533+00	
00000000-0000-0000-0000-000000000000	f9dd85f4-3dee-4080-a9c1-7a5378d74958	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 17:31:13.184198+00	
00000000-0000-0000-0000-000000000000	9feb7ece-501f-4420-95c7-7f3f72dd26e4	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 18:37:37.544619+00	
00000000-0000-0000-0000-000000000000	fea9e54c-cfdf-4b4e-9480-0c3222a05e0e	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 18:37:37.545304+00	
00000000-0000-0000-0000-000000000000	7e359cff-ef8d-42b7-9f98-291b79d32807	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-24 19:09:04.809865+00	
00000000-0000-0000-0000-000000000000	3fe5324b-a52d-4308-9fb9-e6b4f74ec8e2	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-24 19:09:07.43719+00	
00000000-0000-0000-0000-000000000000	541e910b-2067-4f8b-bb55-f7be9f097d51	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 20:33:19.510256+00	
00000000-0000-0000-0000-000000000000	4e73215d-4c6b-495c-96a7-4e2b9f9f5e13	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 20:33:19.511047+00	
00000000-0000-0000-0000-000000000000	7a08e5e6-c3b7-4dfd-9ea1-7ee0f9d251b0	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 22:33:32.614222+00	
00000000-0000-0000-0000-000000000000	54134149-4571-45dd-9bce-86e0825dca3d	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-24 22:33:32.614952+00	
00000000-0000-0000-0000-000000000000	5706bdb6-efbc-429e-a88d-d17e6f838eae	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-25 16:24:51.320301+00	
00000000-0000-0000-0000-000000000000	f6ed4731-1982-4279-994a-7d1995dd4a20	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-25 16:24:51.32102+00	
00000000-0000-0000-0000-000000000000	b2f4827d-3aba-430c-9ea2-1726ba8565b2	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-25 17:01:13.749186+00	
00000000-0000-0000-0000-000000000000	405d6af2-45f5-4df3-80a9-9d6bbb39dfc3	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 17:01:16.626087+00	
00000000-0000-0000-0000-000000000000	a273cdf4-060f-43de-8c72-cc901647a77a	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-25 17:01:27.632041+00	
00000000-0000-0000-0000-000000000000	45b32f2e-2636-4849-90f9-b268131ad8d8	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 17:02:44.127583+00	
00000000-0000-0000-0000-000000000000	08c861f2-0350-4446-b9c1-4c3f98ce1dcc	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"aconde@gep.com.mx","user_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","user_phone":""}}	2025-07-25 17:18:25.516198+00	
00000000-0000-0000-0000-000000000000	5c939a7e-3a35-4e75-b099-24375c8bd13b	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 17:22:24.856339+00	
00000000-0000-0000-0000-000000000000	403fdac0-18b3-4ad3-b0a9-f329ddac24bf	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-25 19:01:57.377956+00	
00000000-0000-0000-0000-000000000000	dd7e6336-5081-4215-a12b-48cf51b0c714	{"action":"logout","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-25 19:02:17.035966+00	
00000000-0000-0000-0000-000000000000	fdfe316e-9e8b-4f3c-a0cf-6d4ec167bc1f	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 17:07:41.016219+00	
00000000-0000-0000-0000-000000000000	3e8fca8d-6bc8-4514-be9c-1d32c04ea36c	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 17:07:41.016873+00	
00000000-0000-0000-0000-000000000000	b624a2b0-dd92-488a-8cda-c2f62b8258cb	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 18:09:59.922476+00	
00000000-0000-0000-0000-000000000000	c7183294-a5d1-4f0c-9115-17168962e7ea	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 18:09:59.92316+00	
00000000-0000-0000-0000-000000000000	eb4fcf1e-3f20-4fca-87c3-10edce042be7	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 21:52:12.085676+00	
00000000-0000-0000-0000-000000000000	80c3787c-9f87-4f5e-853c-dc147c2120aa	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 21:52:12.086372+00	
00000000-0000-0000-0000-000000000000	34b23921-f0dd-4c51-94e2-2572f07b9d2b	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-29 21:57:16.944744+00	
00000000-0000-0000-0000-000000000000	cefbba82-ed17-4bae-98f5-b910e2d9eba2	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"qa@gep.com.mx","user_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","user_phone":""}}	2025-07-29 22:22:28.878854+00	
00000000-0000-0000-0000-000000000000	33a02610-d4cb-4059-a22e-cd1dd4f7d333	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 22:50:27.981664+00	
00000000-0000-0000-0000-000000000000	9d9360b4-caa6-4bd8-a7ba-b990b216d9dd	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 22:50:27.982315+00	
00000000-0000-0000-0000-000000000000	604d4d9a-1d70-4f2a-8279-5b2a23cf6a21	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-29 23:01:04.009056+00	
00000000-0000-0000-0000-000000000000	b1368a8f-6974-40bb-8f73-3d228a1290a5	{"action":"login","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-29 23:01:07.68189+00	
00000000-0000-0000-0000-000000000000	02ab3850-ee0b-4090-b2bc-6492cbbb1646	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 23:01:32.913244+00	
00000000-0000-0000-0000-000000000000	db267666-c445-409c-a6ff-eb753f4a6619	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-29 23:01:32.913652+00	
00000000-0000-0000-0000-000000000000	612e1188-bdad-43be-a45c-5892ba7bcb94	{"action":"logout","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-29 23:04:01.164684+00	
00000000-0000-0000-0000-000000000000	6c3375ad-ce7c-4426-af1e-442bf6eedfbf	{"action":"login","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-29 23:04:07.820246+00	
00000000-0000-0000-0000-000000000000	71d9c7a3-e92b-4be7-a4d3-62e8a9fa9083	{"action":"logout","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-29 23:04:12.537739+00	
00000000-0000-0000-0000-000000000000	b89abbdf-803b-4ab3-b4c4-40d76c79a53f	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-29 23:20:27.270251+00	
00000000-0000-0000-0000-000000000000	34accc92-c3c0-4794-8dff-381f367aa39a	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 14:46:30.403725+00	
00000000-0000-0000-0000-000000000000	a66f5619-b6d7-421f-8700-b6c0ac242710	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 14:46:30.40459+00	
00000000-0000-0000-0000-000000000000	5cf070b4-8dd0-41eb-b43c-a8ec31fbf7f9	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-07-30 14:50:59.620708+00	
00000000-0000-0000-0000-000000000000	857d7ffa-42b5-4d91-83b8-1fd8c5dcc290	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-30 15:00:08.652968+00	
00000000-0000-0000-0000-000000000000	3f656ca7-726f-4816-9740-4db56ad1f2e5	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-30 15:18:39.232958+00	
00000000-0000-0000-0000-000000000000	32e8d361-34a6-42e1-a6b9-15c1599f716c	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-30 16:29:19.192092+00	
00000000-0000-0000-0000-000000000000	f00e92a8-7f2c-491b-97bf-e1bbe4c195e1	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 17:27:32.896442+00	
00000000-0000-0000-0000-000000000000	5cd6f11e-f18a-4017-ba00-24304fd84a5e	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 17:27:32.897368+00	
00000000-0000-0000-0000-000000000000	0c93ea42-74ee-4033-a459-772c380d8d55	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 18:25:43.788602+00	
00000000-0000-0000-0000-000000000000	0f521f6f-318b-4b4f-a40d-f2525f405834	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 18:25:43.789192+00	
00000000-0000-0000-0000-000000000000	4f984691-ac67-4ddb-a1e7-fee4a8704ebe	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-30 18:44:18.093469+00	
00000000-0000-0000-0000-000000000000	e476b260-f2f3-4bc2-83f4-c91018785b93	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 19:24:05.508103+00	
00000000-0000-0000-0000-000000000000	8afaaba1-68a4-4e71-a686-aa4c5c7f8af2	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 19:24:05.508852+00	
00000000-0000-0000-0000-000000000000	e44f4e58-566e-41a5-bbbd-432ef5bc82b3	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 20:22:31.845477+00	
00000000-0000-0000-0000-000000000000	b1798fa3-254f-4f3d-8890-85f5e46112c5	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 20:22:31.846144+00	
00000000-0000-0000-0000-000000000000	d83dffbf-33bf-4715-850c-8eb84202d19c	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 21:20:31.664781+00	
00000000-0000-0000-0000-000000000000	c4127bbc-6fa5-4839-94d6-b2896d740e98	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 21:20:31.66547+00	
00000000-0000-0000-0000-000000000000	79afd53e-ff1b-49c4-9670-9abd1b4af39d	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 22:18:44.650617+00	
00000000-0000-0000-0000-000000000000	cb9884f7-bb2f-402d-89dc-8e485ebf8799	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 22:18:44.651372+00	
00000000-0000-0000-0000-000000000000	4574ed81-c34f-4d0d-97e9-1d8b7717f8d2	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 23:17:01.396044+00	
00000000-0000-0000-0000-000000000000	0407a306-c25c-4d0b-ac08-69bf9b4ac6bc	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-30 23:17:01.396686+00	
00000000-0000-0000-0000-000000000000	9af55ead-cda5-4b42-9804-c901c276d37d	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 15:08:14.569845+00	
00000000-0000-0000-0000-000000000000	f370912e-8e4a-48c7-9f3b-b323e738e45a	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 15:08:14.570653+00	
00000000-0000-0000-0000-000000000000	0e345d49-2133-44d9-a7c9-9e92ca4d346e	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 16:00:07.91798+00	
00000000-0000-0000-0000-000000000000	cb9b2336-150e-4c6a-aa53-53a7ced17f10	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 16:00:07.918645+00	
00000000-0000-0000-0000-000000000000	d9f662b7-916c-4b48-93b7-efdf44fe6a82	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 16:06:36.978764+00	
00000000-0000-0000-0000-000000000000	3e05b8d5-eaab-4589-b1ba-f471509c8505	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 16:06:36.979451+00	
00000000-0000-0000-0000-000000000000	8d66c489-8164-443c-8322-72a396b18fd4	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 17:04:46.324618+00	
00000000-0000-0000-0000-000000000000	5b415b25-409c-4bfd-9348-fb9a2b8913f3	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 17:04:46.325192+00	
00000000-0000-0000-0000-000000000000	0de238e4-9a3b-47b9-8d41-680bc9bf9ce3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 17:51:34.674773+00	
00000000-0000-0000-0000-000000000000	34c91da0-570e-4503-a5b6-712d063b9abb	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 17:51:34.675894+00	
00000000-0000-0000-0000-000000000000	ae1b1044-4d18-4d22-96fa-23aa4c66bdfa	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 18:02:58.08539+00	
00000000-0000-0000-0000-000000000000	a6cfddda-b0c5-4fa5-9ad6-77ea4ccecbee	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 18:02:58.086093+00	
00000000-0000-0000-0000-000000000000	908f228b-691d-4a80-b80d-bab6df07735e	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-31 18:19:39.088523+00	
00000000-0000-0000-0000-000000000000	e75eb5a2-4023-4ddc-bebb-613bb79d2141	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 19:04:12.797348+00	
00000000-0000-0000-0000-000000000000	5086ffcd-ad34-4ac6-89fc-1142015acfd7	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 19:04:12.798065+00	
00000000-0000-0000-0000-000000000000	906b0f91-a997-43f9-ac78-2f502249e87b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 19:04:26.429413+00	
00000000-0000-0000-0000-000000000000	d98e1866-240c-4da6-b4c5-d7fbc14ab4d7	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 19:04:26.429787+00	
00000000-0000-0000-0000-000000000000	435c91ac-5295-4414-86dc-80d1a1d4f6b7	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 19:19:41.351588+00	
00000000-0000-0000-0000-000000000000	aa28b463-e699-4630-8de7-32e136ce56bd	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-07-31 19:19:41.352316+00	
00000000-0000-0000-0000-000000000000	f6c9137d-b9c5-457c-a37d-7871eabb7666	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-07-31 23:40:15.75503+00	
00000000-0000-0000-0000-000000000000	c6b3e86e-96f8-4f6a-b744-dee2d8e30e73	{"action":"token_refreshed","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 01:36:57.8987+00	
00000000-0000-0000-0000-000000000000	652ae0dc-40ed-4726-b636-f42ee1f9de9a	{"action":"token_revoked","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 01:36:57.89947+00	
00000000-0000-0000-0000-000000000000	5345d9e2-8e8d-4aae-9a11-7ba7e619c199	{"action":"logout","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-01 02:01:27.503915+00	
00000000-0000-0000-0000-000000000000	bb9432fe-0ad4-4a82-a19c-8daa663444be	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 16:00:17.900851+00	
00000000-0000-0000-0000-000000000000	9bb756b8-bcfa-4e13-ab3d-7a7c5a5c88a3	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 16:00:17.901535+00	
00000000-0000-0000-0000-000000000000	f50a92b1-9229-4a55-b7fd-c731c1fcbcca	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-01 18:15:26.976215+00	
00000000-0000-0000-0000-000000000000	04e64401-0ee5-41ac-9c67-e93cfd325b7b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 18:18:27.357079+00	
00000000-0000-0000-0000-000000000000	5fbc0955-736f-457b-b93c-526b3e6503b1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 18:18:27.357653+00	
00000000-0000-0000-0000-000000000000	94610374-c104-4069-aecd-ee1742dbb1ff	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 20:22:11.298957+00	
00000000-0000-0000-0000-000000000000	67b0f190-726b-4d72-aabd-bd5fa7eaa9e1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-01 20:22:11.299672+00	
00000000-0000-0000-0000-000000000000	a3e845f6-6a8f-4b7f-b4ef-7806075e48db	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-02 19:47:24.685117+00	
00000000-0000-0000-0000-000000000000	a89650ee-c006-44aa-9b21-e013276acef1	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-02 19:47:24.685926+00	
00000000-0000-0000-0000-000000000000	6e910bba-ea9d-413e-b104-4908cd904958	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-03 18:52:10.889235+00	
00000000-0000-0000-0000-000000000000	9538cf98-73e8-4d47-98bf-ee8ce8f7fdc9	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-03 18:52:10.889856+00	
00000000-0000-0000-0000-000000000000	d6653f71-3339-450c-89b2-dbcc6abb575c	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-04 14:59:05.682925+00	
00000000-0000-0000-0000-000000000000	48cefb23-2d2d-40b7-8fa6-cab40fe5aec6	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-04 14:59:05.683597+00	
00000000-0000-0000-0000-000000000000	684613bd-3de3-4899-ae5b-9ab562502d75	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-04 17:08:09.838099+00	
00000000-0000-0000-0000-000000000000	37c0312d-ed5b-48bb-bf72-b1c1eae01e4a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-04 17:08:09.838732+00	
00000000-0000-0000-0000-000000000000	08cbbba1-c2aa-4253-bb05-b0f971b787e9	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-04 23:34:30.50802+00	
00000000-0000-0000-0000-000000000000	f61aeaf2-6295-45c6-9b90-853a8c630fe6	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-04 23:34:30.50871+00	
00000000-0000-0000-0000-000000000000	14cde9c3-fa65-4df6-8968-748fbb667988	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-05 20:23:28.665116+00	
00000000-0000-0000-0000-000000000000	098b2295-7853-4556-9ba2-3c62e9c5bbac	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-05 22:23:00.837079+00	
00000000-0000-0000-0000-000000000000	74b4f932-8c72-4717-887b-d449c6c7f772	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-05 22:23:00.83781+00	
00000000-0000-0000-0000-000000000000	3f57b14a-e3bf-4d44-b37a-8a9ec93109b7	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-05 22:23:08.086521+00	
00000000-0000-0000-0000-000000000000	cb404e0b-0118-4774-8da1-3db8756c6739	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-05 22:23:14.115457+00	
00000000-0000-0000-0000-000000000000	e560369a-e16a-44e6-a21b-89f00dcf66c7	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-05 23:23:00.898517+00	
00000000-0000-0000-0000-000000000000	6c80ebf4-57c2-42e5-83d0-94d4a9d4d728	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-05 23:23:00.899189+00	
00000000-0000-0000-0000-000000000000	272eaa6f-1306-4d82-8995-98a3b8b7bd1e	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 00:23:31.90109+00	
00000000-0000-0000-0000-000000000000	3322262e-ea14-43ee-bd36-4520dd1e1cee	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 00:23:31.901805+00	
00000000-0000-0000-0000-000000000000	c400ca88-c540-408b-91ee-08cf3da59c35	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-06 00:59:47.822706+00	
00000000-0000-0000-0000-000000000000	0d9415d0-17a9-4d89-9f81-120f4711f055	{"action":"logout","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-06 01:12:21.843006+00	
00000000-0000-0000-0000-000000000000	104bfdbf-430e-47ea-98e5-145399d659af	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-06 02:32:50.536581+00	
00000000-0000-0000-0000-000000000000	49e821ba-497e-48bb-beb0-ffcec995f6e9	{"action":"login","actor_id":"329ac582-cb03-43b1-b1be-e01f5c187ca2","actor_username":"aconde@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-06 03:02:58.865374+00	
00000000-0000-0000-0000-000000000000	1bba02cf-860f-4cdd-b9f0-ff9172a4efe6	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 16:03:35.050426+00	
00000000-0000-0000-0000-000000000000	4035346c-ec90-4e93-931f-ef94872663d9	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 16:03:35.051128+00	
00000000-0000-0000-0000-000000000000	6883b3eb-5d47-464b-848c-967bde58e0d4	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 17:02:00.481911+00	
00000000-0000-0000-0000-000000000000	310a3f1b-142c-4f27-a0b8-5bf2b886d7c9	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 17:02:00.482593+00	
00000000-0000-0000-0000-000000000000	062c5cbd-fd4e-43f4-8a39-343a1e300346	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 18:00:10.861551+00	
00000000-0000-0000-0000-000000000000	58de5671-e71a-4808-b073-e17363e49fa5	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 18:00:10.862222+00	
00000000-0000-0000-0000-000000000000	fc42544d-dacb-43e6-9cda-0aa78252e632	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 18:58:40.937471+00	
00000000-0000-0000-0000-000000000000	0c5b54ab-3c76-4038-bbe0-f487121cfaf0	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-06 18:58:40.938021+00	
00000000-0000-0000-0000-000000000000	2829b92e-32dc-4b22-8c07-b19156f17c1c	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 04:37:11.083406+00	
00000000-0000-0000-0000-000000000000	c63f3db1-6eb6-4790-ae80-ddaa6b5c8f80	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 04:37:11.08409+00	
00000000-0000-0000-0000-000000000000	42a9f8d9-ee3c-4199-9e50-e04d2e31ad70	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 13:31:46.44417+00	
00000000-0000-0000-0000-000000000000	5716c18b-c60e-4185-b423-a0714c8bb323	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 13:31:46.444854+00	
00000000-0000-0000-0000-000000000000	72add995-94c3-43a8-bc82-33e40cbcac1b	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-08 13:44:35.332509+00	
00000000-0000-0000-0000-000000000000	700ca653-17e4-4194-9a9c-e53d48ba4639	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 15:24:21.564386+00	
00000000-0000-0000-0000-000000000000	86359da1-4c49-40ee-a991-a507064f8cec	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 15:24:21.565147+00	
00000000-0000-0000-0000-000000000000	331ca3c2-7679-464e-a977-c84667615a44	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 15:50:46.514723+00	
00000000-0000-0000-0000-000000000000	0101448f-7fa7-44d8-a048-58ba4d29575f	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 15:50:46.515733+00	
00000000-0000-0000-0000-000000000000	3fefe90c-5e7b-48da-9827-761b3c7678de	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-08 15:52:16.135461+00	
00000000-0000-0000-0000-000000000000	93e5c6c4-0dc5-45b9-ad7b-d819fb2f1d6e	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 17:06:20.539518+00	
00000000-0000-0000-0000-000000000000	25e739a0-6c5e-4b5e-b6fd-f20fde7341a7	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 17:06:20.540189+00	
00000000-0000-0000-0000-000000000000	845939aa-1297-4cf6-bd64-57d4b5ca5013	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 17:59:27.037092+00	
00000000-0000-0000-0000-000000000000	4fb1eaea-ef09-45e4-b183-3d680dfc3222	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 17:59:27.03775+00	
00000000-0000-0000-0000-000000000000	d809314e-4bdb-4f8b-bbfb-bb07a31f81c3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 18:24:38.079489+00	
00000000-0000-0000-0000-000000000000	0b3587ff-b362-45a7-bb15-36c394eacaa3	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 18:24:38.080362+00	
00000000-0000-0000-0000-000000000000	52bae502-a3a2-4fe9-aa1a-093734cb600d	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-08 18:26:58.650541+00	
00000000-0000-0000-0000-000000000000	bdf386df-88ef-4dd1-b0e6-82e5772c8c3d	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 18:33:59.242712+00	
00000000-0000-0000-0000-000000000000	5f281267-dc8a-4024-8141-065c272b1f8e	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 18:33:59.243358+00	
00000000-0000-0000-0000-000000000000	82d0b10d-98f2-4fc1-8cbc-a1d0c598c091	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 18:57:36.332431+00	
00000000-0000-0000-0000-000000000000	2b182cc3-cdb3-496a-8807-e8aeb986a01f	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 18:57:36.333065+00	
00000000-0000-0000-0000-000000000000	cc4a3803-cd43-478a-848b-81505b1f0b6a	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 19:26:31.05186+00	
00000000-0000-0000-0000-000000000000	48ee8daf-fb50-4643-9fc3-b80bd372538b	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 19:26:31.052655+00	
00000000-0000-0000-0000-000000000000	f9c93459-e299-479c-82e8-a730904d56e1	{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"vdiaz3@gmail.com","user_id":"405d7cb4-0ae3-4868-a9c5-404764150cf5"}}	2025-08-08 19:31:31.325362+00	
00000000-0000-0000-0000-000000000000	e7244ce1-476c-4185-930d-1f7e5b0668b5	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 20:26:42.178748+00	
00000000-0000-0000-0000-000000000000	b0455af1-2ebf-41b8-8ead-131d7117adae	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 20:26:42.179377+00	
00000000-0000-0000-0000-000000000000	e2d0ef4f-dd43-4f7b-bbaa-a30b389d44b7	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 21:37:26.528861+00	
00000000-0000-0000-0000-000000000000	a8390207-51b2-4420-9fb4-37a50438168e	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 21:37:26.529476+00	
00000000-0000-0000-0000-000000000000	f2549078-d416-4d05-b4a3-5ef60d1218a0	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 22:52:13.334154+00	
00000000-0000-0000-0000-000000000000	b18f2e37-829d-4ef9-accf-33b27b89ee1a	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 22:52:13.334835+00	
00000000-0000-0000-0000-000000000000	6418ef82-2e26-4131-a6db-6267bdd1515b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 23:21:33.807584+00	
00000000-0000-0000-0000-000000000000	5e748e5e-6d75-4bf3-aa98-28c02406be3b	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-08 23:21:33.808567+00	
00000000-0000-0000-0000-000000000000	f05cffaf-a07b-47d5-b9f7-7c1820a69ed3	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-09 18:05:11.27183+00	
00000000-0000-0000-0000-000000000000	686e2295-da1d-4e74-87a4-23a10cf79ac9	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-09 18:05:11.272465+00	
00000000-0000-0000-0000-000000000000	7b0b0197-58f4-44a6-8a67-d3a2ad50b07b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-09 19:14:37.107026+00	
00000000-0000-0000-0000-000000000000	191be925-7a2f-4881-8ea9-3eaa1d87cc20	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-09 19:14:37.107706+00	
00000000-0000-0000-0000-000000000000	9d875b65-59c2-49ac-88db-5b13d04d60e6	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 13:36:31.044915+00	
00000000-0000-0000-0000-000000000000	0bb84e6e-e091-4f2e-a56e-2146ffd94502	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 13:36:31.045629+00	
00000000-0000-0000-0000-000000000000	ee6e8bee-3152-4817-acc7-95dae1bb77c9	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 15:21:28.18029+00	
00000000-0000-0000-0000-000000000000	59bb6b6d-8b6c-423d-aa7d-f9c5d7caaa31	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 15:21:28.180944+00	
00000000-0000-0000-0000-000000000000	a74c997c-0bca-47cc-a746-32adc058669e	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 15:44:39.94721+00	
00000000-0000-0000-0000-000000000000	07987f40-1a4e-4e1c-bb26-013dfcf973a1	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 15:44:39.947941+00	
00000000-0000-0000-0000-000000000000	43b80f63-68dc-4f46-8af4-9b5d3c6d4269	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"citlalyqa@gep.com.mx","user_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","user_phone":""}}	2025-08-11 15:55:47.23003+00	
00000000-0000-0000-0000-000000000000	e56a2714-396c-4078-901f-2676e5a2530a	{"action":"login","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 15:59:49.092837+00	
00000000-0000-0000-0000-000000000000	3b1fd92a-f843-4206-808f-105932e36846	{"action":"logout","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-11 15:59:55.926576+00	
00000000-0000-0000-0000-000000000000	e07f0215-706a-4772-a94f-deb16eba60fd	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"citlalyqa@gep.com.mx","user_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","user_phone":""}}	2025-08-11 16:00:26.28232+00	
00000000-0000-0000-0000-000000000000	a39e8027-eede-48f3-b535-9cf8e0496b06	{"action":"login","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 16:01:05.969517+00	
00000000-0000-0000-0000-000000000000	dadd85cf-0ade-402f-8f3e-49f01efc1a72	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 16:42:46.656507+00	
00000000-0000-0000-0000-000000000000	01b4b680-8be6-450d-b589-4ff0b1b49590	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 16:42:46.657136+00	
00000000-0000-0000-0000-000000000000	bc730867-3b07-4485-8595-ab451a03800e	{"action":"token_refreshed","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 17:00:05.982142+00	
00000000-0000-0000-0000-000000000000	5df1dae8-6aee-44af-8574-f980d13f2a8c	{"action":"token_revoked","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 17:00:05.982856+00	
00000000-0000-0000-0000-000000000000	9cb580d2-d263-4c3a-bc03-0b37a021f2d9	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 17:00:54.547734+00	
00000000-0000-0000-0000-000000000000	ea9589c7-315d-490e-8fa9-7fad400d7f11	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-11 17:20:46.341878+00	
00000000-0000-0000-0000-000000000000	ac87060b-60e3-4e46-817a-19bc9d0ca3bb	{"action":"login","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 17:20:52.868379+00	
00000000-0000-0000-0000-000000000000	a3984bfb-1090-4d06-9564-071098ed8763	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 17:32:42.868006+00	
00000000-0000-0000-0000-000000000000	391346ef-fd33-4a68-ac92-86b763d6319a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 17:32:42.868698+00	
00000000-0000-0000-0000-000000000000	d28f0c7a-2231-451b-bc05-54d90c09f814	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 17:46:12.400289+00	
00000000-0000-0000-0000-000000000000	e0a450ad-8f59-4a0d-82bc-5768b83964e1	{"action":"token_refreshed","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 18:00:05.976436+00	
00000000-0000-0000-0000-000000000000	d31541a4-ef3f-4890-b71d-7f7c337f6608	{"action":"token_revoked","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 18:00:05.977156+00	
00000000-0000-0000-0000-000000000000	26d2f536-e9f3-4e79-99ab-9dcf8093188b	{"action":"token_refreshed","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 18:21:05.946712+00	
00000000-0000-0000-0000-000000000000	7b328f5c-71f6-4537-808f-145353298173	{"action":"token_revoked","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 18:21:05.947429+00	
00000000-0000-0000-0000-000000000000	fd1cce2b-8e6d-474a-8d79-29f25afcfc24	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 18:33:10.201698+00	
00000000-0000-0000-0000-000000000000	ae57e326-5b9d-43af-9dac-b607b3f030a5	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 18:33:10.202416+00	
00000000-0000-0000-0000-000000000000	a67dbb15-d712-48d4-88df-a8b03a0639d1	{"action":"token_refreshed","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:00:07.06168+00	
00000000-0000-0000-0000-000000000000	3ba2e681-aab5-46c9-9765-70aff9f146df	{"action":"token_revoked","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:00:07.06239+00	
00000000-0000-0000-0000-000000000000	78de2370-4e31-4a79-a187-dcb3076e2b88	{"action":"token_refreshed","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:21:05.900965+00	
00000000-0000-0000-0000-000000000000	913d200e-21d9-4afb-832d-65cd36f03bfd	{"action":"token_revoked","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:21:05.901693+00	
00000000-0000-0000-0000-000000000000	4587aaff-1816-4d18-9efe-6b001886419d	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:27:08.176461+00	
00000000-0000-0000-0000-000000000000	843db62d-a7d4-40e2-8b64-4b19a667e25a	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:27:08.177224+00	
00000000-0000-0000-0000-000000000000	4e5d548e-3cac-4bef-b03c-d0d7d40709a9	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:31:53.736789+00	
00000000-0000-0000-0000-000000000000	8dd43d45-2b29-4064-a63c-c249dd7fdc83	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 19:31:53.737459+00	
00000000-0000-0000-0000-000000000000	cafc068a-4501-4fc0-bf89-a99a0bb4c899	{"action":"token_refreshed","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 20:00:06.080522+00	
00000000-0000-0000-0000-000000000000	f8ac73dd-0873-4cf4-bb5f-d1b6baa77d7a	{"action":"token_revoked","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 20:00:06.081319+00	
00000000-0000-0000-0000-000000000000	c5316ddc-8c91-4bbc-b7eb-6b1a76f79acb	{"action":"token_refreshed","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 20:21:05.88944+00	
00000000-0000-0000-0000-000000000000	d46ef694-a497-41b6-82c5-caaee84d9222	{"action":"token_revoked","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 20:21:05.890088+00	
00000000-0000-0000-0000-000000000000	2cdad629-f0d8-43de-8c78-41a8bb0b983d	{"action":"token_refreshed","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 21:00:06.042904+00	
00000000-0000-0000-0000-000000000000	1357f6a8-98d4-4ab0-9522-f767e7e140c9	{"action":"token_revoked","actor_id":"a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1","actor_username":"citlalyqa@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 21:00:06.043651+00	
00000000-0000-0000-0000-000000000000	57651a57-9185-404b-aa14-45b1d5a0a388	{"action":"login","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 21:02:39.39344+00	
00000000-0000-0000-0000-000000000000	6b23c334-1f14-427b-9a64-a433c78fa194	{"action":"logout","actor_id":"445c9d84-7932-470c-9d76-d3f280c4b9a6","actor_username":"qa@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-11 21:02:52.744115+00	
00000000-0000-0000-0000-000000000000	9617198b-1c2e-4258-b46b-66e5e0f311a4	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 21:06:05.543078+00	
00000000-0000-0000-0000-000000000000	0ea79b41-c08d-41f4-9c88-483fa9e9e6ca	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-11 21:06:50.597539+00	
00000000-0000-0000-0000-000000000000	7ce8089c-a0c9-4988-adb1-19a526de59e8	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 22:19:16.27719+00	
00000000-0000-0000-0000-000000000000	b959e0bd-dc6b-4eb6-b320-caa73b39cacf	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-11 22:19:16.27789+00	
00000000-0000-0000-0000-000000000000	7e317269-6ef3-4179-8a41-58b319daa10f	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 04:27:22.970242+00	
00000000-0000-0000-0000-000000000000	edb1a5ac-2650-43ee-8551-a712952dfb94	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 04:27:22.971028+00	
00000000-0000-0000-0000-000000000000	17c153ee-b4bc-476e-a7c4-bcfc25f5066b	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 17:34:41.826099+00	
00000000-0000-0000-0000-000000000000	5f0101a2-8386-4bf7-b28c-f32975c4fdf5	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 17:34:41.826908+00	
00000000-0000-0000-0000-000000000000	23ebd32e-329e-4bd9-852e-af0115506f50	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-12 17:35:41.711131+00	
00000000-0000-0000-0000-000000000000	359e3db8-2337-4d91-9fd9-dbef541fa7fb	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-12 18:20:27.227163+00	
00000000-0000-0000-0000-000000000000	e5600b8c-2f02-4908-aa46-ae62eabe8822	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 18:35:25.59496+00	
00000000-0000-0000-0000-000000000000	d3d68d8a-cfb1-469e-bd85-34ece9d56561	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 18:35:25.595771+00	
00000000-0000-0000-0000-000000000000	8736e2c1-04ae-4aa1-b66f-f5d33691c966	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 18:52:44.985546+00	
00000000-0000-0000-0000-000000000000	b2726da0-7a9f-49ea-a6ee-d21d78573510	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 18:52:44.986295+00	
00000000-0000-0000-0000-000000000000	bc58a125-620e-46ca-9cfd-d14f3e616e82	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 19:35:25.535703+00	
00000000-0000-0000-0000-000000000000	234c5a68-6b50-4f93-a3ba-fbd8706c9189	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 19:35:25.536525+00	
00000000-0000-0000-0000-000000000000	cd8e7d41-10ab-4e2a-a3e3-3a7edfce9090	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-12 20:00:21.535215+00	
00000000-0000-0000-0000-000000000000	66fa7905-d6bc-499f-9218-eb3fe52f7ae8	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 20:35:25.576346+00	
00000000-0000-0000-0000-000000000000	f65d3bd9-5145-4af1-8b83-3e7440c8bee5	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 20:35:25.577018+00	
00000000-0000-0000-0000-000000000000	dc902797-7068-40d6-be37-7ddc61e90b5e	{"action":"token_refreshed","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 20:55:25.907554+00	
00000000-0000-0000-0000-000000000000	36edd340-3173-4189-9d1f-a3724b841a51	{"action":"token_revoked","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 20:55:25.908287+00	
00000000-0000-0000-0000-000000000000	027cee04-9c94-473b-88cd-c7eab8b690b4	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 20:58:57.132066+00	
00000000-0000-0000-0000-000000000000	350aa7f3-d4b2-45fd-b630-455a442f56c9	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 20:58:57.133989+00	
00000000-0000-0000-0000-000000000000	63c7b393-b969-42a0-959f-7ef4f9848be9	{"action":"token_refreshed","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 23:34:04.486171+00	
00000000-0000-0000-0000-000000000000	f48bc0c0-3991-4faa-b2af-c3dbc18b4a0c	{"action":"token_revoked","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"token"}	2025-08-12 23:34:04.487309+00	
00000000-0000-0000-0000-000000000000	d949b84a-292c-4e02-91a1-c3079f3e9489	{"action":"logout","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-12 23:36:54.192753+00	
00000000-0000-0000-0000-000000000000	7ccba625-b60e-4390-812e-4b2b9db9599d	{"action":"login","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-12 23:37:11.366621+00	
00000000-0000-0000-0000-000000000000	a5596652-c18b-40eb-a31f-5e2c5ec02663	{"action":"login","actor_id":"305bfa9c-6966-4043-a194-e9d0bf060f28","actor_username":"cmorales@gep.com.mx","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-08-13 00:04:24.37363+00	
00000000-0000-0000-0000-000000000000	3a621206-04d3-4189-922c-9f6bbb63618c	{"action":"logout","actor_id":"3de786b3-753d-4aa5-a52d-9ca91808c08b","actor_username":"admin@gep.com.mx","actor_via_sso":false,"log_type":"account"}	2025-08-13 00:15:33.197088+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
3de786b3-753d-4aa5-a52d-9ca91808c08b	3de786b3-753d-4aa5-a52d-9ca91808c08b	{"sub": "3de786b3-753d-4aa5-a52d-9ca91808c08b", "email": "admin@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-06-04 01:37:12.331739+00	2025-06-04 01:37:12.331778+00	2025-06-04 01:37:12.331778+00	1fb16109-3c1e-41ee-bd63-953def205d4c
c4a994d9-8d35-483b-a60e-a0eb0a10db6b	c4a994d9-8d35-483b-a60e-a0eb0a10db6b	{"sub": "c4a994d9-8d35-483b-a60e-a0eb0a10db6b", "email": "joeldavidar@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-06-10 20:36:09.253602+00	2025-06-10 20:36:09.253659+00	2025-06-10 20:36:09.253659+00	2f80104a-a1fb-49f1-8d35-c501be56ce29
305bfa9c-6966-4043-a194-e9d0bf060f28	305bfa9c-6966-4043-a194-e9d0bf060f28	{"sub": "305bfa9c-6966-4043-a194-e9d0bf060f28", "email": "cmorales@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-07-23 19:43:37.963368+00	2025-07-23 19:43:37.963412+00	2025-07-23 19:43:37.963412+00	47fe6c8b-bfcf-456b-a30b-78195ff89369
7b8b124e-b43a-4680-920e-a42047702501	7b8b124e-b43a-4680-920e-a42047702501	{"sub": "7b8b124e-b43a-4680-920e-a42047702501", "email": "victorc@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-07-23 23:35:27.643317+00	2025-07-23 23:35:27.643351+00	2025-07-23 23:35:27.643351+00	f8013fbe-6a79-4176-bc28-c97a4eaf0488
329ac582-cb03-43b1-b1be-e01f5c187ca2	329ac582-cb03-43b1-b1be-e01f5c187ca2	{"sub": "329ac582-cb03-43b1-b1be-e01f5c187ca2", "email": "aconde@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-07-25 17:18:25.515435+00	2025-07-25 17:18:25.515468+00	2025-07-25 17:18:25.515468+00	2104bd25-1f95-4be9-af3a-04db101eaf44
445c9d84-7932-470c-9d76-d3f280c4b9a6	445c9d84-7932-470c-9d76-d3f280c4b9a6	{"sub": "445c9d84-7932-470c-9d76-d3f280c4b9a6", "email": "qa@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-07-29 22:22:28.87821+00	2025-07-29 22:22:28.878241+00	2025-07-29 22:22:28.878241+00	269e3bd3-745d-4379-a609-a0e015467a69
405d7cb4-0ae3-4868-a9c5-404764150cf5	405d7cb4-0ae3-4868-a9c5-404764150cf5	{"sub": "405d7cb4-0ae3-4868-a9c5-404764150cf5", "email": "vdiaz3@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-08-08 19:31:31.324092+00	2025-08-08 19:31:31.324222+00	2025-08-08 19:31:31.324222+00	b499fe19-3584-4d99-b762-fa3b89e82cb2
a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	{"sub": "a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1", "email": "citlalyqa@gep.com.mx", "email_verified": false, "phone_verified": false}	email	2025-08-11 15:55:47.229228+00	2025-08-11 15:55:47.229287+00	2025-08-11 15:55:47.229287+00	7829094b-f6a5-4823-a868-1212cc374958
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
d5a16839-4008-4724-8423-31615110442a	2025-08-06 02:32:50.53923+00	2025-08-06 02:32:50.53923+00	password	f580616a-6634-4581-a4d3-6839f7cee687
3e15b902-7679-4fc8-8a0d-dc8d44ed4e76	2025-08-06 03:02:58.867809+00	2025-08-06 03:02:58.867809+00	password	01467c59-2bc0-4656-a342-ba1b55fdae8f
e9dc0482-1f08-4573-ab43-70b33e448a0c	2025-08-11 16:01:05.972574+00	2025-08-11 16:01:05.972574+00	password	409b8f27-a7a8-4452-94b2-35eebb29d4f2
47b37f0a-e8e6-4c56-826e-1214eb99aea0	2025-08-13 00:04:24.377873+00	2025-08-13 00:04:24.377873+00	password	96aa436d-eaca-4497-bb33-1bdd2bd3f9b0
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
8e9bcf8e-ac3f-4ef5-a9ec-c6fe1518609e	405d7cb4-0ae3-4868-a9c5-404764150cf5	confirmation_token	dcfd7df25ccb6f57328354c3a8d931c684cb79cfb386a7c2fb40de9b	vdiaz3@gmail.com	2025-08-08 19:31:32.813195	2025-08-08 19:31:32.813195
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	293	cwr3tubvmr7x	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	t	2025-08-11 16:01:05.971152+00	2025-08-11 17:00:05.983636+00	\N	e9dc0482-1f08-4573-ab43-70b33e448a0c
00000000-0000-0000-0000-000000000000	295	f35eqzaiyhhl	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	t	2025-08-11 17:00:05.984082+00	2025-08-11 18:00:05.977517+00	cwr3tubvmr7x	e9dc0482-1f08-4573-ab43-70b33e448a0c
00000000-0000-0000-0000-000000000000	264	w76fhau2aryo	329ac582-cb03-43b1-b1be-e01f5c187ca2	f	2025-08-06 02:32:50.538287+00	2025-08-06 02:32:50.538287+00	\N	d5a16839-4008-4724-8423-31615110442a
00000000-0000-0000-0000-000000000000	265	qwvzo2jucoo5	329ac582-cb03-43b1-b1be-e01f5c187ca2	f	2025-08-06 03:02:58.866745+00	2025-08-06 03:02:58.866745+00	\N	3e15b902-7679-4fc8-8a0d-dc8d44ed4e76
00000000-0000-0000-0000-000000000000	327	pgoanmiquptl	305bfa9c-6966-4043-a194-e9d0bf060f28	f	2025-08-13 00:04:24.376712+00	2025-08-13 00:04:24.376712+00	\N	47b37f0a-e8e6-4c56-826e-1214eb99aea0
00000000-0000-0000-0000-000000000000	300	y2wf2rkfn63k	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	t	2025-08-11 18:00:05.977963+00	2025-08-11 19:00:07.062729+00	f35eqzaiyhhl	e9dc0482-1f08-4573-ab43-70b33e448a0c
00000000-0000-0000-0000-000000000000	303	neq7lduhsaix	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	t	2025-08-11 19:00:07.063167+00	2025-08-11 20:00:06.081666+00	y2wf2rkfn63k	e9dc0482-1f08-4573-ab43-70b33e448a0c
00000000-0000-0000-0000-000000000000	307	zgith3js65ou	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	t	2025-08-11 20:00:06.082098+00	2025-08-11 21:00:06.043974+00	neq7lduhsaix	e9dc0482-1f08-4573-ab43-70b33e448a0c
00000000-0000-0000-0000-000000000000	309	jppx5mupmb7u	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	f	2025-08-11 21:00:06.044428+00	2025-08-11 21:00:06.044428+00	zgith3js65ou	e9dc0482-1f08-4573-ab43-70b33e448a0c
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
e9dc0482-1f08-4573-ab43-70b33e448a0c	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	2025-08-11 16:01:05.97034+00	2025-08-11 21:00:06.045945+00	\N	aal1	\N	2025-08-11 21:00:06.045897	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	187.173.224.162	\N
d5a16839-4008-4724-8423-31615110442a	329ac582-cb03-43b1-b1be-e01f5c187ca2	2025-08-06 02:32:50.53739+00	2025-08-06 02:32:50.53739+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	189.130.19.23	\N
3e15b902-7679-4fc8-8a0d-dc8d44ed4e76	329ac582-cb03-43b1-b1be-e01f5c187ca2	2025-08-06 03:02:58.866189+00	2025-08-06 03:02:58.866189+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	189.130.19.23	\N
47b37f0a-e8e6-4c56-826e-1214eb99aea0	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-08-13 00:04:24.376019+00	2025-08-13 00:04:24.376019+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	189.251.26.104	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	7b8b124e-b43a-4680-920e-a42047702501	authenticated	authenticated	victorc@gep.com.mx	$2a$10$HeSI6yJOHRbbvjlPwWOHM.3OqAPtIapXWryrYSXbISyJ2P241h3ny	2025-07-23 23:35:27.644858+00	\N		\N		\N			\N	2025-07-24 00:26:56.337887+00	{"provider": "email", "providers": ["email"]}	{"nombre": "Victor", "perfil": "Analista GEP", "apellido": "Cauch", "email_verified": true}	\N	2025-07-23 23:35:27.641925+00	2025-07-24 00:26:56.339404+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	authenticated	authenticated	citlalyqa@gep.com.mx	$2a$10$.88C1zF.mcEBtAcL1VEj0.bjNeZtZ9iu3gAzL.HKfVdyryU3f5eIy	2025-08-11 15:55:47.230922+00	\N		\N		\N			\N	2025-08-11 16:01:05.970209+00	{"provider": "email", "providers": ["email"]}	{"nombre": "Citlaly", "perfil": "Analista GEP", "apellido": "Morales QA", "email_verified": true}	\N	2025-08-11 15:55:47.227979+00	2025-08-11 21:00:06.045186+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	445c9d84-7932-470c-9d76-d3f280c4b9a6	authenticated	authenticated	qa@gep.com.mx	$2a$10$1/bdenfMcDjHfPoN9nZHv.Jcp.g7kZBetVUo5a8qCd12LM7oTad/C	2025-07-29 22:22:28.879741+00	\N		\N		\N			\N	2025-08-11 21:02:39.394207+00	{"provider": "email", "providers": ["email"]}	{"nombre": "QA", "perfil": "Analista GEP", "apellido": "Tester", "email_verified": true}	\N	2025-07-29 22:22:28.877134+00	2025-08-11 21:02:39.395958+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	329ac582-cb03-43b1-b1be-e01f5c187ca2	authenticated	authenticated	aconde@gep.com.mx	$2a$10$Gl7oJSx82xsomDnrWAfvteTRM2rwBGTovfHsD0ebq3mDPvKTgxT3C	2025-07-25 17:18:25.51709+00	\N		\N		\N			\N	2025-08-06 03:02:58.866099+00	{"provider": "email", "providers": ["email"]}	{"nombre": "Adelaida", "perfil": "Administrador", "apellido": "Conde", "email_verified": true}	\N	2025-07-25 17:18:25.514254+00	2025-08-06 03:02:58.867537+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c4a994d9-8d35-483b-a60e-a0eb0a10db6b	authenticated	authenticated	joeldavidar@gep.com.mx	$2a$10$RBPTL..GxBzy8c0Kn5O3YOEP6z/S2KfzMd7YhGmvEq36AcuRhx5d2	2025-06-10 20:36:09.255613+00	\N		\N		\N			\N	2025-06-10 20:47:27.173082+00	{"provider": "email", "providers": ["email"]}	{"nombre": "joel", "perfil": "Analista GEP", "apellido": "araujo", "email_verified": true}	\N	2025-06-10 20:36:09.251388+00	2025-06-10 20:47:27.17451+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	405d7cb4-0ae3-4868-a9c5-404764150cf5	authenticated	authenticated	vdiaz3@gmail.com		\N	2025-08-08 19:31:31.326706+00	dcfd7df25ccb6f57328354c3a8d931c684cb79cfb386a7c2fb40de9b	2025-08-08 19:31:31.326706+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2025-08-08 19:31:31.320061+00	2025-08-08 19:31:32.810419+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3de786b3-753d-4aa5-a52d-9ca91808c08b	authenticated	authenticated	admin@gep.com.mx	$2a$10$sLjNnMpt63mjN0daXPhxQ./Tnk13Q/1M7Spih2N8DLI3ycAOd4aRW	2025-06-04 01:37:12.333014+00	\N		\N		\N			\N	2025-08-12 23:37:11.367052+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-06-04 01:37:12.330769+00	2025-08-12 23:37:11.36835+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	305bfa9c-6966-4043-a194-e9d0bf060f28	authenticated	authenticated	cmorales@gep.com.mx	$2a$10$is3dTK6D9SIBMjevcPrQHOzdse3P4umTPLYytEFp/OIB44ttRcY12	2025-07-23 19:43:37.96563+00	\N		\N		\N			\N	2025-08-13 00:04:24.375937+00	{"provider": "email", "providers": ["email"]}	{"nombre": "Citlaly", "perfil": "Administrador", "apellido": "Morales Magos", "email_verified": true}	\N	2025-07-23 19:43:37.959844+00	2025-08-13 00:04:24.377598+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: alertas_directorio; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.alertas_directorio (id_alerta, created_at, id_cliente, status_alerta, temas, sub_tema, fuente, estado, id_doc_senado, id_analista, enviado_correo, datetime_enviado_correo, link_pdf_enviado) FROM stdin;
38	2025-08-08 18:44:49.694852+00	3da8818f-9846-4b22-b7b0-5bdef6341771	f	Citricultura	Agua - Gestión Sustentable	Diario Oficial de la Federación	Pendiente	3575	\N	\N	\N	\N
40	2025-08-08 18:44:49.694852+00	9e19d403-2d22-4f56-bc6b-82c4ca52152a	f	Inteligencia artificial	IMPACTO ECONÓMICO, SALUD PÚBLICA	CONAMER	Pendiente	3578	\N	\N	\N	\N
41	2025-08-08 18:44:49.694852+00	575a320c-87fe-4e2f-a606-0b1d6ec39d50	f	Tecnologías de la información	Salud Pública - Prevención de Adicciones	Cámara de Senadores	Pendiente	3566	\N	\N	\N	\N
42	2025-08-08 18:44:49.694852+00	22e9fee4-631d-42c3-9446-d28d03945bde	f	Protección de Datos Personales	Derechos Humanos - Menstruación Digna	Cámara de Senadores	Pendiente	3564	\N	\N	\N	\N
37	2025-08-08 18:44:49.694852+00	3da8818f-9846-4b22-b7b0-5bdef6341771	f	Adquisiciones / Licitaciones / Obras Públicas	Alimentación - Inseguridad Alimentaria, Derechos Humanos	Cámara de Diputados	enviadas	3560	\N	t	2025-08-08 19:02:15.8+00	\N
39	2025-08-08 18:44:49.694852+00	9e19d403-2d22-4f56-bc6b-82c4ca52152a	f	Adquisiciones / Licitaciones / Obras Públicas	Alimentación - Inseguridad Alimentaria, Derechos Humanos	Cámara de Diputados	enviadas	3560	\N	t	2025-08-13 00:13:04.032+00	\N
\.


--
-- Data for Name: bot_executions; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.bot_executions (id, fuente, fecha, tipo, ejecutado_por, estatus, detalles) FROM stdin;
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.clientes (id_cliente, empresa_admin, nombre_cliente, cargo, email, telefono, temas_suscrit, estado, creado_en, listas_distribucion, logo, siglas, id_cliente_numerico) FROM stdin;
b081ed18-82f6-4cdd-b45d-cc825d7c6699	\N	Nuevo Cliente	\N	\N	\N	{"Telefonía móvil","Registro Vehicular"}	inactivo	2025-07-23 22:57:22.468+00	"[{\\"id\\":\\"1753321687202\\",\\"nombre\\":\\"sgdfgfg\\",\\"temas_subtemas\\":[\\"Telefonía móvil\\",\\"Registro Vehicular\\"],\\"correos\\":[\\"joeldavidar@gmail.com\\"]}]"	\N	CL	1
86c6044c-b80e-4e36-9d12-3917087554f5	\N	Cliente Fomento Económico Mexicano, S.A.B. de C.V.	\N	\N	\N	{"Administración de Justicia","Contaminación del agua"}	activo	2025-07-24 19:10:19.925+00	"[{\\"id\\":\\"1753384201212\\",\\"nombre\\":\\"nombre\\",\\"temas_subtemas\\":[\\"Administración de Justicia\\",\\"Contaminación del agua\\"],\\"correos\\":[\\"correo@mail.com\\"]}]"	https://masterd.gepdigital.ai/storage/v1/object/public/logo/1753384217343.jpeg	CL	2
3da8818f-9846-4b22-b7b0-5bdef6341771	\N	demo cliente 21 7	\N	\N	\N	{"Administración Pública","Adquisiciones / Licitaciones / Obras Públicas","Plataformas digitales",Citricultura}	activo	2025-07-21 17:54:48.838+00	"[{\\"id\\":\\"1753120486340\\",\\"nombre\\":\\"probando lists\\",\\"temas_subtemas\\":[\\"Administración Pública\\",\\"Adquisiciones / Licitaciones / Obras Públicas\\",\\"Plataformas digitales\\",\\"Citricultura\\"],\\"correos\\":[\\"joeldavidar@gmail.com\\"]}]"	https://masterd.gepdigital.ai/storage/v1/object/public/logo/1753120471790.jpg	kaande	3
ec251052-9496-4836-869a-cc971f5f13fe	\N	PepsiCo, Inc.	\N	\N	\N	{"Administración de Justicia","Contaminación del agua",Medicamentos,Alimentos,"Canasta Básica/ Alimentos"}	activo	2025-07-29 22:47:14.426+00	"[{\\"id\\":\\"1753829224517\\",\\"nombre\\":\\"Lista uno\\",\\"temas_subtemas\\":[\\"Administración de Justicia\\",\\"Contaminación del agua\\",\\"Medicamentos\\",\\"Alimentos\\",\\"Canasta Básica/ Alimentos\\"],\\"correos\\":[\\"usuario1@yopmail.com\\",\\"usuario2@yopmail.com\\"]}]"	https://masterd.gepdigital.ai/storage/v1/object/public/logo/1753829163400.png	PPco	5
575a320c-87fe-4e2f-a606-0b1d6ec39d50	\N	Comercio Digital	\N	\N	\N	{"Agenda Digital",Ciberseguridad,"Delitos Digitales",General,"Impuestos digitales","Inteligencia Artificial",Internet,"Monedas y activos digitales","Plataformas digitales","Redes sociales","Tecnologías de la información"}	activo	2025-07-30 18:59:55.731+00	"[{\\"id\\":\\"1753901981470\\",\\"nombre\\":\\"Lista Unica\\",\\"temas_subtemas\\":[\\"Agenda Digital\\",\\"Ciberseguridad\\",\\"Delitos Digitales\\",\\"General\\",\\"Impuestos digitales\\",\\"Inteligencia Artificial\\",\\"Internet\\",\\"Monedas y activos digitales\\",\\"Plataformas digitales\\",\\"Redes sociales\\",\\"Tecnologías de la información\\"],\\"correos\\":[\\"cmorales@canteradigital.mx\\",\\"testcmm@hotmail.com\\",\\"citlalyqa@gep.com.mx\\",\\"citlalymoralesmagos@gmail.com\\",\\"citlalyqa@yopmail.com\\"]}]"	https://masterd.gepdigital.ai/storage/v1/object/public/logo/1753901916711.png	CD	6
22e9fee4-631d-42c3-9446-d28d03945bde	\N	Fintech financiero	\N	\N	\N	{Financiero,"Comisiones Bancarias",Crédito,"Criptoactivos / Criptomonedas","Educación Financiera",Hipotecario,"Instituciones de crédito","Lavado de dinero","Pagos electrónicos","Protección de Datos Personales","Secreto Bancario","Servicios Financieros","Tarjetas de crédito","Tasas de interés","Tecnología financiera","Títulos de crédito",Transparencia}	activo	2025-07-30 19:02:26.189+00	"[{\\"id\\":\\"1753902138259\\",\\"nombre\\":\\"Lista de Fintech Asociados\\",\\"temas_subtemas\\":[\\"Financiero\\",\\"Comisiones Bancarias\\",\\"Crédito\\",\\"Criptoactivos / Criptomonedas\\",\\"Educación Financiera\\",\\"Hipotecario\\",\\"Instituciones de crédito\\",\\"Lavado de dinero\\",\\"Pagos electrónicos\\",\\"Protección de Datos Personales\\",\\"Secreto Bancario\\",\\"Servicios Financieros\\",\\"Tarjetas de crédito\\",\\"Tasas de interés\\",\\"Tecnología financiera\\",\\"Títulos de crédito\\",\\"Transparencia\\"],\\"correos\\":[\\"cmorales@canteradigital.mx\\",\\"testcmm@hotmail.com\\",\\"citlalymoralesmagos@gmail.com\\",\\"citlalyqa@yopmail.com\\"]}]"	https://masterd.gepdigital.ai/storage/v1/object/public/logo/1753902068999.png	FINTECH	7
9e19d403-2d22-4f56-bc6b-82c4ca52152a	\N	Fomentooo Económico Mexicano, S.A.B. de C.V.	\N	\N	\N	{"Administración de Justicia","Adulteración combustibles","Administración Pública","Adquisiciones / Licitaciones / Obras Públicas","Agenda Digital","Inteligencia artificial","Plataformas digitales","Responsabilidad civil","Sistemas Satelitales","Telefonía móvil",Financiero,"Comisiones Bancarias",Ciberseguridad,Educacion,"Educación media superior"}	activo	2025-07-23 18:49:07.944+00	"[{\\"id\\":\\"1753296541213\\",\\"nombre\\":\\"Lista general 1\\",\\"temas_subtemas\\":[\\"Administración de Justicia\\",\\"Adulteración combustibles\\",\\"Administración Pública\\",\\"Adquisiciones / Licitaciones / Obras Públicas\\",\\"Agenda Digital\\",\\"Inteligencia artificial\\",\\"Plataformas digitales\\",\\"Responsabilidad civil\\",\\"Sistemas Satelitales\\",\\"Telefonía móvil\\"],\\"correos\\":[\\"usuari1@yopmail.com\\",\\"usuario2@yopmail.com\\",\\"usuario3@yopmail.com\\"]},{\\"id\\":\\"1754928307303\\",\\"nombre\\":\\"Lista de distribucion 2\\",\\"temas_subtemas\\":[\\"Financiero\\",\\"Comisiones Bancarias\\",\\"Agenda Digital\\",\\"Ciberseguridad\\",\\"Educacion\\",\\"Educación media superior\\"],\\"correos\\":[\\"citlalyqa@gep.com.mx\\",\\"usuario3@yopmail.com\\"]}]"	https://masterd.gepdigital.ai/storage/v1/object/public/logo/1753296496345.png	FEMSA	8
67d565cd-4005-4293-abc1-15e976c65d76	\N	Cliente de prueba QA	\N	\N	\N	{"Agenda Digital",Ciberseguridad,"Delitos Digitales",General,"Impuestos digitales","Inteligencia Artificial",Internet,"Monedas y activos digitales","Plataformas digitales","Redes sociales","Tecnologías de la información",Educacion,"Brecha digital educativa","Educación básica","Educación media superior",Financiero,"Comisiones Bancarias",Crédito,"Educación superior"}	activo	2025-08-11 17:43:38.792+00	"[{\\"id\\":\\"1754934204353\\",\\"nombre\\":\\"LISTA D\\",\\"temas_subtemas\\":[\\"Agenda Digital\\",\\"Ciberseguridad\\",\\"Delitos Digitales\\",\\"General\\",\\"Impuestos digitales\\",\\"Inteligencia Artificial\\",\\"Internet\\",\\"Monedas y activos digitales\\",\\"Plataformas digitales\\",\\"Redes sociales\\",\\"Tecnologías de la información\\",\\"Educacion\\",\\"Brecha digital educativa\\",\\"Educación básica\\",\\"Educación media superior\\",\\"Financiero\\",\\"Comisiones Bancarias\\",\\"Crédito\\",\\"Educación superior\\"],\\"correos\\":[\\"CORREO@YOPMAIL.COM\\"]}]"	\N	TEST QA	9
4f628b39-7dae-4acb-8046-974c0eb981a6	\N	Cliente test	\N	\N	\N	{"Administración de Justicia","Adulteración combustibles",Internet,"Inteligencia Artificial",Agua,Desabasto,Privatizacion,Salud,Agricultura}	inactivo	2025-07-31 16:29:37.739+00	"[{\\"id\\":\\"1753979337878\\",\\"nombre\\":\\"lISTA UNO modificado\\",\\"temas_subtemas\\":[\\"Administración de Justicia\\",\\"Adulteración combustibles\\",\\"Internet\\",\\"Inteligencia Artificial\\"],\\"correos\\":[\\"correo@mail.com\\",\\"correo@mail.com\\"]},{\\"id\\":\\"1753979375674\\",\\"nombre\\":\\"Liata dos\\",\\"temas_subtemas\\":[\\"Agua\\",\\"Desabasto\\",\\"Privatizacion\\",\\"Salud\\"],\\"correos\\":[\\"correo@mail.com\\",\\"correo@mail.com\\"]},{\\"id\\":\\"1753979447844\\",\\"nombre\\":\\"Lista treeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeees\\",\\"temas_subtemas\\":[\\"Agricultura\\"],\\"correos\\":[\\"correo@mail.com\\"]}]"	\N	CLT	4
\.


--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.emails (id_email, created_at, email, email_status, email_nombre_dest, telefono_nombre_destino) FROM stdin;
1	2025-06-25 02:49:01.150235+00	vdiaz3@gmail.com	t	vladimir diaz	+525583139537
\.


--
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.empresas (id_empresa, created_at, id_usuario, nombre_em, rfc, giro, sitio_web) FROM stdin;
3	2025-06-04 01:28:45.831303+00	4949	probandob ttt hh	234543234321	494949	https://nocodeveloper.com
\.


--
-- Data for Name: gep_ia_attributes; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.gep_ia_attributes (id_attribute, created_at, id_person, attribute_text, attribute_desc) FROM stdin;
1	2025-05-31 02:34:45.336628+00	1	Cargo Actual	Presidenta de la República de México
2	2025-05-31 02:35:08.409313+00	1	foto	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Claudia_Sheinbaum_Feb._2025_%282%29.jpg/1200px-Claudia_Sheinbaum_Feb._2025_%282%29.jpg\n
3	2025-05-31 02:35:26.396355+00	1	Cargo Anterior	Gobierno de la CDMX 2023-2024
4	2025-05-31 02:54:05.712708+00	2	foto	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Rosa_Icela.jpg/250px-Rosa_Icela.jpg
5	2025-05-31 03:33:51.642954+00	4	foto	https://upload.wikimedia.org/wikipedia/commons/b/b7/Olga_S%C3%A1nchez_Cordero_sen.jpg\n
6	2025-05-31 03:34:08.024981+00	5	foto	https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Ricardo_Monreal_%C3%81vila_en_2021.jpg/1200px-Ricardo_Monreal_%C3%81vila_en_2021.jpg
7	2025-06-13 20:29:08.019489+00	6	alegra	bello
8	2025-06-13 20:32:09.032779+00	6	foto	https://media.licdn.com/dms/image/v2/D5603AQG7_-E9ac95jQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1696621014773?e=1755129600&v=beta&t=9PPP8BbiP7cXdWmqAiT6lc1ahrb09xbEcs-GTw4OSEI
\.


--
-- Data for Name: gep_ia_personas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.gep_ia_personas (id_person, created_at, person_full_name, person_status) FROM stdin;
1	2025-05-31 02:33:19.9332+00	Claudia Sheinbaum Pardo	t
2	2025-05-31 02:33:34.17476+00	Rosa Icela Rodríguez Velázquez	t
3	2025-05-31 02:33:45.622257+00	Juan Ramón de la Fuente Ramírez	t
4	2025-05-31 03:32:04.433031+00	Olga María del Carmen Sánchez Cordero Dávila	t
5	2025-05-31 03:32:16.512795+00	Ricardo Monreal Ávila	t
6	2025-06-13 20:28:36.956708+00	Vladimir	t
\.


--
-- Data for Name: gep_ia_relation_type; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.gep_ia_relation_type (id_type_relation_id, created_at, type_relation_text, type_relation_desc, type_relation_status) FROM stdin;
1	2025-05-31 02:36:29.651955+00	Presidencia	Presidencia de la República	t
2	2025-05-31 03:33:08.394607+00	Senado	Senado de la República	t
3	2025-06-13 20:29:48.830541+00	Amor	\N	t
\.


--
-- Data for Name: gep_ia_relations; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.gep_ia_relations (id_relation, created_at, mother_id_person, child_id_person, id_type_relation_id, peso) FROM stdin;
2	2025-05-31 02:36:42.564517+00	1	3	1	1
1	2025-05-31 02:36:04.38596+00	1	2	1	10
3	2025-05-31 03:32:37.152935+00	4	5	2	3
4	2025-06-13 20:30:06.658009+00	1	6	3	5
\.


--
-- Data for Name: listaod_seandores_diputados; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.listaod_seandores_diputados (id_funcionario, created_at, institucion, nombre, partido, representacion) FROM stdin;
1	2025-07-15 11:11:11+00	dipudatos	Abramo Masso Yerico	PRI	Coahuila
2	2025-07-15 11:11:11+00	dipudatos	Abreu Artiñano Rocío Adriana	Morena	Representación Proporcional
3	2025-07-15 11:11:11+00	dipudatos	Acosta Islas Anabel	PVEM	Sonora
4	2025-07-15 11:11:11+00	dipudatos	Acosta Trujillo Juana	Morena	Guanajuato
5	2025-07-15 11:11:11+00	dipudatos	Aguilar Gil Lilia	PT	Chihuahua
6	2025-07-15 11:11:11+00	dipudatos	Aguilar López José Alejandro	PT	Tlaxcala
7	2025-07-15 11:11:11+00	dipudatos	Aguirre Gallardo José Javier	Morena	Guanajuato
8	2025-07-15 11:11:11+00	dipudatos	Alatriste Cantú Adolfo	PVEM	Puebla
9	2025-07-15 11:11:11+00	dipudatos	Albores Gleason Roberto Armando	PT	Chiapas
10	2025-07-15 11:11:11+00	dipudatos	Aldana Navarro Luis Humberto	Morena	Quintana Roo
11	2025-07-15 11:11:11+00	dipudatos	Alonso Gutiérrez Agustín	Morena	Morelos
12	2025-07-15 11:11:11+00	dipudatos	Alonso Que Erubiel Lorenzo	PRI	Representación Proporcional
13	2025-07-15 11:11:11+00	dipudatos	Alonso Reyes Miguel Alejandro	PRI	Representación Proporcional
14	2025-07-15 11:11:11+00	dipudatos	Álvarez López Jesús Emiliano	Morena	Ciudad de México
15	2025-07-15 11:11:11+00	dipudatos	Álvarez Nemer Mónica Angélica	Morena	México
16	2025-07-15 11:11:11+00	dipudatos	Álvarez Villaseñor Raúl	Morena	Jalisco
17	2025-07-15 11:11:11+00	dipudatos	Ambriz Delgadillo Humberto	PRI	Aguascalientes
18	2025-07-15 11:11:11+00	dipudatos	Anaya Llamas José Guillermo	PAN	Coahuila
19	2025-07-15 11:11:11+00	dipudatos	Anaya Martínez Josefina	Morena	México
20	2025-07-15 11:11:11+00	dipudatos	Anaya Villegas Sandra	Morena	Morelos
21	2025-07-15 11:11:11+00	dipudatos	Andrade Zurutuza Daniel	Morena	Hidalgo
22	2025-07-15 11:11:11+00	dipudatos	Antonio Altamirano Carol	Morena	Oaxaca
23	2025-07-15 11:11:11+00	dipudatos	Arellano Ávila Giselle Yunueen	Morena	Representación Proporcional
24	2025-07-15 11:11:11+00	dipudatos	Armendáriz Guerra Carmen Patricia	Morena	Representación Proporcional
25	2025-07-15 11:11:11+00	dipudatos	Armenta Oliveros Magaly	Morena	Veracruz
26	2025-07-15 11:11:11+00	dipudatos	Arredondo Ramos Abigail	PRI	Representación Proporcional
27	2025-07-15 11:11:11+00	dipudatos	Arreola López Haidyd	Morena	Jalisco
28	2025-07-15 11:11:11+00	dipudatos	Arreola Trinidad Azucena	Morena	Chiapas
29	2025-07-15 11:11:11+00	dipudatos	Arzola Vargas Xóchitl Teresa	Morena	México
30	2025-07-15 11:11:11+00	dipudatos	Asaf Manjarrez Daniel	Morena	Representación Proporcional
31	2025-07-15 11:11:11+00	dipudatos	Astudillo Suárez Ricardo	PVEM	Querétaro
32	2025-07-15 11:11:11+00	dipudatos	Ávila Anaya Arturo	Morena	Representación Proporcional
33	2025-07-15 11:11:11+00	dipudatos	Ávila Flores Claudia Selene	Morena	Jalisco
34	2025-07-15 11:11:11+00	dipudatos	Ávila Vera Mildred Concepción	Morena	Quintana Roo
35	2025-07-15 11:11:11+00	dipudatos	Ávila Villegas Eruviel	PVEM	Representación Proporcional
36	2025-07-15 11:11:11+00	dipudatos	Avilés Álvarez Alejandro	PVEM	Representación Proporcional
37	2025-07-15 11:11:11+00	dipudatos	Avilés Domínguez Leide	Morena	México
38	2025-07-15 11:11:11+00	dipudatos	Ayala Leyva Ana Elizabeth	Morena	Sinaloa
39	2025-07-15 11:11:11+00	dipudatos	Azuara Zúñiga David	PAN	San Luis Potosí
40	2025-07-15 11:11:11+00	dipudatos	Baldenebro Arredondo Manuel de Jesús	Morena	Sonora
41	2025-07-15 11:11:11+00	dipudatos	Balderas Trejo Ana María	PAN	Representación Proporcional
42	2025-07-15 11:11:11+00	dipudatos	Ballesteros García María de los Ángeles	Morena	Puebla
43	2025-07-15 11:11:11+00	dipudatos	Ballesteros Mancilla Laura Irais	MC	Representación Proporcional
44	2025-07-15 11:11:11+00	dipudatos	Barrera Maldonado Leticia	PRI	Representación Proporcional
45	2025-07-15 11:11:11+00	dipudatos	Barrera Puc Rocío Natali	Morena	Yucatán
46	2025-07-15 11:11:11+00	dipudatos	Barrera Vázquez Ariadna	Morena	Morelos
47	2025-07-15 11:11:11+00	dipudatos	Barreras Samaniego Diana Karina	PT	Sonora
48	2025-07-15 11:11:11+00	dipudatos	Basto González Gabriela del Carmen	Morena	Campeche
49	2025-07-15 11:11:11+00	dipudatos	Bautista Bravo Juan Angel	Morena	México
50	2025-07-15 11:11:11+00	dipudatos	Bautista Peláez María del Carmen	Morena	Oaxaca
51	2025-07-15 11:11:11+00	dipudatos	Bautista Villegas Oscar	PVEM	San Luis Potosí
52	2025-07-15 11:11:11+00	dipudatos	Beltrán Reyes Anay	Morena	México
53	2025-07-15 11:11:11+00	dipudatos	Benavides Castañeda José Alberto	PT	Ciudad de México
54	2025-07-15 11:11:11+00	dipudatos	Benavides Cobos Gabriela	PVEM	Representación Proporcional
55	2025-07-15 11:11:11+00	dipudatos	Benítez Estrada Rufina	Morena	Representación Proporcional
56	2025-07-15 11:11:11+00	dipudatos	Benítez Tiburcio Mariana	Morena	Representación Proporcional
57	2025-07-15 11:11:11+00	dipudatos	Bernal Martínez Mary Carmen	PT	Michoacán
58	2025-07-15 11:11:11+00	dipudatos	Betanzos Cortés Israel	PRI	Representación Proporcional
59	2025-07-15 11:11:11+00	dipudatos	Blancas Mercado Bruno	Morena	Jalisco
60	2025-07-15 11:11:11+00	dipudatos	Blanco Bravo Cuauhtémoc	Morena	Representación Proporcional
61	2025-07-15 11:11:11+00	dipudatos	Bolaños Cacho Cué Raúl	PVEM	Oaxaca
62	2025-07-15 11:11:11+00	dipudatos	Borboa Becerra Omar Antonio	PAN	Jalisco
63	2025-07-15 11:11:11+00	dipudatos	Borrego Adame Francisco Javier	Morena	Coahuila
64	2025-07-15 11:11:11+00	dipudatos	Braña Mojica José	PVEM	Tamaulipas
65	2025-07-15 11:11:11+00	dipudatos	Brito Zapata Óscar Iván	Morena	Yucatán
66	2025-07-15 11:11:11+00	dipudatos	Brown Figueredo Hilda Araceli	Morena	Baja California
67	2025-07-15 11:11:11+00	dipudatos	Burgos Hernández Anaís Miriam	Morena	México
68	2025-07-15 11:11:11+00	dipudatos	Caamal Cocom Venustiano	Morena	Representación Proporcional
69	2025-07-15 11:11:11+00	dipudatos	Cabada Alvidrez Héctor Armando	Morena	Representación Proporcional
70	2025-07-15 11:11:11+00	dipudatos	Cabrera Lagunas Ma. del Carmen	PVEM	Guerrero
71	2025-07-15 11:11:11+00	dipudatos	Calcaneo Constantino Karen Yaiti	Morena	Representación Proporcional
72	2025-07-15 11:11:11+00	dipudatos	Calderón Díaz Alejandro	Morena	Guanajuato
73	2025-07-15 11:11:11+00	dipudatos	Calzada Mercado Mario	PRI	Querétaro
74	2025-07-15 11:11:11+00	dipudatos	Campos Plancarte Daniel	Morena	Ciudad de México
75	2025-07-15 11:11:11+00	dipudatos	Cantú Ramírez Andrés Mauricio	PRI	Nuevo León
76	2025-07-15 11:11:11+00	dipudatos	Canturosas Villarreal Carlos Enrique	PVEM	Tamaulipas
301	2025-07-15 11:11:11+00	dipudatos	Miranda Barrera Luis Enrique	PVEM	México
77	2025-07-15 11:11:11+00	dipudatos	Carbajal Méndez Liliana	PVEM	Representación Proporcional
78	2025-07-15 11:11:11+00	dipudatos	Cárdenas Galván Clara	Morena	Jalisco
79	2025-07-15 11:11:11+00	dipudatos	Carranza Gómez Beatriz	Morena	Jalisco
80	2025-07-15 11:11:11+00	dipudatos	Carrasco Godínez Melva	Morena	México
81	2025-07-15 11:11:11+00	dipudatos	Carrazco Macías Olegaria	Morena	Sinaloa
82	2025-07-15 11:11:11+00	dipudatos	Carrillo Cubillas Mario Miguel	Morena	Puebla
83	2025-07-15 11:11:11+00	dipudatos	Carrillo Soberanis Juan Luis	PVEM	Quintana Roo
84	2025-07-15 11:11:11+00	dipudatos	Carvajal Hidalgo Alejandro	Morena	Puebla
85	2025-07-15 11:11:11+00	dipudatos	Castellanos Polanco Favio	Morena	Jalisco
86	2025-07-15 11:11:11+00	dipudatos	Castillo Gabino Diana	PT	México
87	2025-07-15 11:11:11+00	dipudatos	Castillo García Gilberto Daniel	Morena	Representación Proporcional
88	2025-07-15 11:11:11+00	dipudatos	Castillo López Eduardo	Morena	Puebla
89	2025-07-15 11:11:11+00	dipudatos	Castillo Lozano Katia Alejandra	Morena	Jalisco
90	2025-07-15 11:11:11+00	dipudatos	Castillo Medina Nubia Iris	PAN	Representación Proporcional
91	2025-07-15 11:11:11+00	dipudatos	Castillo Morales Francisco Adrián	Morena	San Luis Potosí
92	2025-07-15 11:11:11+00	dipudatos	Castillo Pérez Carlos Alonso	Morena	Representación Proporcional
93	2025-07-15 11:11:11+00	dipudatos	Castillo Quintana Elda Esther del Carmen	Morena	Campeche
94	2025-07-15 11:11:11+00	dipudatos	Castro Bello Christian Mishel	PRI	Representación Proporcional
95	2025-07-15 11:11:11+00	dipudatos	Castro Salinas Rosa María	Morena	Representación Proporcional
96	2025-07-15 11:11:11+00	dipudatos	Castro Trenti Fernando Jorge	Morena	Representación Proporcional
97	2025-07-15 11:11:11+00	dipudatos	Castro Villarreal Antonio Lorenzo	Morena	Coahuila
98	2025-07-15 11:11:11+00	dipudatos	Ceja García Xitlalic	PRI	Representación Proporcional
99	2025-07-15 11:11:11+00	dipudatos	Cervantes De la Cruz Elizabeth	Morena	Veracruz
100	2025-07-15 11:11:11+00	dipudatos	Chávez Rojas Olga Leticia	Morena	Representación Proporcional
101	2025-07-15 11:11:11+00	dipudatos	Chávez Velázquez Noel	PRI	Chihuahua
102	2025-07-15 11:11:11+00	dipudatos	Chedraui Peralta Alejandra	Morena	Representación Proporcional
103	2025-07-15 11:11:11+00	dipudatos	Chimal García Fidel Daniel	PAN	Representación Proporcional
104	2025-07-15 11:11:11+00	dipudatos	Cornejo Gómez Astrit Viridiana	Morena	Hidalgo
105	2025-07-15 11:11:11+00	dipudatos	Corona Arvizu Armando	Morena	México
106	2025-07-15 11:11:11+00	dipudatos	Corral Ordóñez Jesús Roberto	PT	Chihuahua
107	2025-07-15 11:11:11+00	dipudatos	Corro Mendoza Margarita	Morena	Veracruz
108	2025-07-15 11:11:11+00	dipudatos	Cortés Mendoza David Alejandro	PAN	Michoacán
109	2025-07-15 11:11:11+00	dipudatos	Coss y León Zúñiga Humberto	Morena	Representación Proporcional
110	2025-07-15 11:11:11+00	dipudatos	Cota Cárdenas Manuel Alejandro	PVEM	Baja California Sur
111	2025-07-15 11:11:11+00	dipudatos	Crespo Arroyo Ricardo	Morena	Hidalgo
112	2025-07-15 11:11:11+00	dipudatos	Cruz Jiménez Martha Aracely	PT	Representación Proporcional
113	2025-07-15 11:11:11+00	dipudatos	Cruz Lucatero José Luis	Morena	Michoacán
114	2025-07-15 11:11:11+00	dipudatos	Cruz Mendoza Carmelo	Morena	Oaxaca
115	2025-07-15 11:11:11+00	dipudatos	Cruz Peláez Fátima Almendra	PVEM	Puebla
116	2025-07-15 11:11:11+00	dipudatos	Cuanalo Araujo Jesús Martín	PVEM	México
117	2025-07-15 11:11:11+00	dipudatos	Cuevas Sánchez Cintia	Morena	Coahuila
118	2025-07-15 11:11:11+00	dipudatos	Damián Retes César Israel	PAN	Representación Proporcional
119	2025-07-15 11:11:11+00	dipudatos	De Hoyos Walther Gustavo Adolfo	MC	Representación Proporcional
120	2025-07-15 11:11:11+00	dipudatos	De la Luz Rivas María Isidra	PT	Representación Proporcional
121	2025-07-15 11:11:11+00	dipudatos	De la Mora Torreblanca Marco Antonio	PVEM	Guerrero
122	2025-07-15 11:11:11+00	dipudatos	De la Rosa García Juan Hugo	Morena	México
123	2025-07-15 11:11:11+00	dipudatos	De la Vega Sánchez Alma Lidia	Morena	Hidalgo
124	2025-07-15 11:11:11+00	dipudatos	De la Vega Vargas Alma Rosa	Morena	Guanajuato
125	2025-07-15 11:11:11+00	dipudatos	De los Santos Flores Casandra Prisilla	PVEM	Tamaulipas
126	2025-07-15 11:11:11+00	dipudatos	Del Muro García Ana Luisa	PT	Zacatecas
127	2025-07-15 11:11:11+00	dipudatos	Del Río Zenteno Karina Margarita	Morena	Chiapas
128	2025-07-15 11:11:11+00	dipudatos	Del Valle Ramírez Alejandra	Morena	Durango
129	2025-07-15 11:11:11+00	dipudatos	Delgado Carrillo Felipe Miguel	PVEM	Representación Proporcional
130	2025-07-15 11:11:11+00	dipudatos	Díaz Luis Armando	PT	Baja California Sur
131	2025-07-15 11:11:11+00	dipudatos	Díaz Vilchis Catalina	Morena	Representación Proporcional
132	2025-07-15 11:11:11+00	dipudatos	Domínguez Domínguez César Alejandro	PRI	Chihuahua
133	2025-07-15 11:11:11+00	dipudatos	Domínguez Nava Graciela	Morena	Sinaloa
134	2025-07-15 11:11:11+00	dipudatos	Domínguez Rodríguez Roberto Ángel	Morena	México
135	2025-07-15 11:11:11+00	dipudatos	Domínguez Serna Yoloczin Lizbeth	Morena	Guerrero
136	2025-07-15 11:11:11+00	dipudatos	Domínguez Ugarte Paloma	PRI	Representación Proporcional
137	2025-07-15 11:11:11+00	dipudatos	Durán Alarcón Greycy Marian	PT	Representación Proporcional
138	2025-07-15 11:11:11+00	dipudatos	Durán Reveles José Luis	PVEM	México
139	2025-07-15 11:11:11+00	dipudatos	Döring Casar Federico	PAN	Ciudad de México
140	2025-07-15 11:11:11+00	dipudatos	Ealy Díaz María Teresa	Morena	Representación Proporcional
141	2025-07-15 11:11:11+00	dipudatos	Ebrard Lestrade Sebastián	Morena	Representación Proporcional
142	2025-07-15 11:11:11+00	dipudatos	Elizondo Guerra Olga Juliana	PT	Tamaulipas
143	2025-07-15 11:11:11+00	dipudatos	Escobar García Zenyazen Roberto	Morena	Veracruz
144	2025-07-15 11:11:11+00	dipudatos	Espino Barrientos Manuel de Jesús	Morena	Representación Proporcional
145	2025-07-15 11:11:11+00	dipudatos	Espino Suárez Mayra	PVEM	Representación Proporcional
146	2025-07-15 11:11:11+00	dipudatos	Espinosa Ramos Francisco Amadeo	PT	Representación Proporcional
147	2025-07-15 11:11:11+00	dipudatos	Espinosa Sánchez Paola Milagros	PAN	Jalisco
148	2025-07-15 11:11:11+00	dipudatos	Espinoza Eguia Juan Francisco	PRI	Nuevo León
149	2025-07-15 11:11:11+00	dipudatos	Esponda Torres Flor de María	Morena	Chiapas
150	2025-07-15 11:11:11+00	dipudatos	Estrada Domínguez Francisco Javier	Morena	Guanajuato
151	2025-07-15 11:11:11+00	dipudatos	Farfán Vázquez Leticia	Morena	Representación Proporcional
152	2025-07-15 11:11:11+00	dipudatos	Farias Bailón Francisco Javier	MC	Representación Proporcional
153	2025-07-15 11:11:11+00	dipudatos	Fernández César Mónica	Morena	Representación Proporcional
154	2025-07-15 11:11:11+00	dipudatos	Fernández Cruz Nayeli Arlen	PVEM	Representación Proporcional
155	2025-07-15 11:11:11+00	dipudatos	Fernández Fuentes Luis Humberto	Morena	Querétaro
156	2025-07-15 11:11:11+00	dipudatos	Fernández Martínez José Luis	PVEM	San Luis Potosí
157	2025-07-15 11:11:11+00	dipudatos	Fernández Samaniego José Armando	Morena	Baja California
158	2025-07-15 11:11:11+00	dipudatos	Fernández Sarabia Zayra Linette	Morena	Representación Proporcional
159	2025-07-15 11:11:11+00	dipudatos	Ferráez Centeno Ana Miriam	Morena	Veracruz
160	2025-07-15 11:11:11+00	dipudatos	Ferreyro Rosado Abril	PAN	Representación Proporcional
161	2025-07-15 11:11:11+00	dipudatos	Flores Bustamante Juan Ángel	Morena	Morelos
162	2025-07-15 11:11:11+00	dipudatos	Flores Cervantes Hugo Eric	Morena	Representación Proporcional
163	2025-07-15 11:11:11+00	dipudatos	Flores Elizondo Patricia	MC	Representación Proporcional
164	2025-07-15 11:11:11+00	dipudatos	Flores Robles Ramón Ángel	PT	Sonora
165	2025-07-15 11:11:11+00	dipudatos	Fonseca Galicia Celia Esther	PVEM	Representación Proporcional
166	2025-07-15 11:11:11+00	dipudatos	Gaitán Díaz María Graciela	PVEM	Representación Proporcional
167	2025-07-15 11:11:11+00	dipudatos	Gali López José Antonio	PVEM	Puebla
168	2025-07-15 11:11:11+00	dipudatos	Galindo Alarcón Patricia	PT	México
169	2025-07-15 11:11:11+00	dipudatos	Gallardo García Fausto	PVEM	Baja California
170	2025-07-15 11:11:11+00	dipudatos	Gallardo Juárez Ricardo	PVEM	Representación Proporcional
171	2025-07-15 11:11:11+00	dipudatos	Gamboa Torales María Josefina	PAN	Veracruz
172	2025-07-15 11:11:11+00	dipudatos	Gaona Domínguez Eduardo	MC	Representación Proporcional
173	2025-07-15 11:11:11+00	dipudatos	Garay Loredo Irma Yordana	PT	Tlaxcala
174	2025-07-15 11:11:11+00	dipudatos	Garcés Medina Edén	Morena	Ciudad de México
175	2025-07-15 11:11:11+00	dipudatos	García Antonio Briceyda	Morena	San Luis Potosí
176	2025-07-15 11:11:11+00	dipudatos	García García Margarita	PT	Oaxaca
177	2025-07-15 11:11:11+00	dipudatos	García Hernández Claudia	Morena	Jalisco
178	2025-07-15 11:11:11+00	dipudatos	García Hernández Gabriel	Morena	Ciudad de México
179	2025-07-15 11:11:11+00	dipudatos	García Hernández Jesús Fernando	PT	Sinaloa
180	2025-07-15 11:11:11+00	dipudatos	García León María de Fátima	MC	Representación Proporcional
181	2025-07-15 11:11:11+00	dipudatos	García Romero Rafaela Vianey	Morena	Puebla
182	2025-07-15 11:11:11+00	dipudatos	García Vidaña Martha Olivia	Morena	Durango
183	2025-07-15 11:11:11+00	dipudatos	García Jimeno Alcocer Ma. Lorena	PAN	Querétaro
184	2025-07-15 11:11:11+00	dipudatos	Garfias Alcántara Claudia Leticia	Morena	México
185	2025-07-15 11:11:11+00	dipudatos	Garza De la Garza Samantha Margarita	PAN	Nuevo León
186	2025-07-15 11:11:11+00	dipudatos	Gil Rullán Sergio	MC	Representación Proporcional
187	2025-07-15 11:11:11+00	dipudatos	Ginez Serrano Teresa	PAN	Representación Proporcional
188	2025-07-15 11:11:11+00	dipudatos	Gloria López José	PT	Nuevo León
189	2025-07-15 11:11:11+00	dipudatos	Godoy Rangel Leonel	Morena	Michoacán
190	2025-07-15 11:11:11+00	dipudatos	Gómez Alarcón Amarante Gonzalo	PT	Representación Proporcional
191	2025-07-15 11:11:11+00	dipudatos	Gómez Cárdenas Annia Sarahí	PAN	Nuevo León
192	2025-07-15 11:11:11+00	dipudatos	Gómez Maldonado Maiella Martha Gabriela	Morena	Representación Proporcional
193	2025-07-15 11:11:11+00	dipudatos	Gómez Pozos Merilyn	Morena	Jalisco
194	2025-07-15 11:11:11+00	dipudatos	Gómez Urrutia Napoleón	Morena	Representación Proporcional
195	2025-07-15 11:11:11+00	dipudatos	Gómez Villalobos Tecutli José Guadalupe	MC	Jalisco
196	2025-07-15 11:11:11+00	dipudatos	González Alonso Carmen Rocío	PAN	Representación Proporcional
197	2025-07-15 11:11:11+00	dipudatos	González Flandez Deliamaría	PVEM	Chiapas
198	2025-07-15 11:11:11+00	dipudatos	González Franco Amancay	MC	Representación Proporcional
199	2025-07-15 11:11:11+00	dipudatos	González González Ana Isabel	PRI	Nuevo León
200	2025-07-15 11:11:11+00	dipudatos	González Hernández Juan Antonio	Morena	Puebla
201	2025-07-15 11:11:11+00	dipudatos	González Naveda Adrián	PT	Veracruz
202	2025-07-15 11:11:11+00	dipudatos	González Pérez Sandra Beatriz	Morena	Jalisco
203	2025-07-15 11:11:11+00	dipudatos	González Soto Santiago	PT	Nuevo León
204	2025-07-15 11:11:11+00	dipudatos	Granados Trespalacios María Angélica	PAN	Chihuahua
205	2025-07-15 11:11:11+00	dipudatos	Graniel Zenteno Rosa Margarita	Morena	Tabasco
206	2025-07-15 11:11:11+00	dipudatos	Guerra Castillo Marcela	PRI	Representación Proporcional
207	2025-07-15 11:11:11+00	dipudatos	Guerrero Esquivel Fuensanta Guadalupe	PRI	Representación Proporcional
208	2025-07-15 11:11:11+00	dipudatos	Guerrero Pérez Eleazar	Morena	Representación Proporcional
209	2025-07-15 11:11:11+00	dipudatos	Guevara Garza Carlos Alberto	PVEM	Nuevo León
210	2025-07-15 11:11:11+00	dipudatos	Guevara Rodríguez Miguel Ángel	PAN	Representación Proporcional
211	2025-07-15 11:11:11+00	dipudatos	Guízar Macías Francisco Javier	PT	Jalisco
212	2025-07-15 11:11:11+00	dipudatos	Gutiérrez Arroyo Hugo Eduardo	PRI	Representación Proporcional
213	2025-07-15 11:11:11+00	dipudatos	Gutiérrez Bocanegra Julio Ernesto	Morena	Tabasco
214	2025-07-15 11:11:11+00	dipudatos	Gutiérrez Garza Blanca Leticia	PAN	Representación Proporcional
215	2025-07-15 11:11:11+00	dipudatos	Gutiérrez Luna Sergio Carlos	Morena	Representación Proporcional
216	2025-07-15 11:11:11+00	dipudatos	Gutiérrez Mancilla Carlos Eduardo	PRI	Representación Proporcional
217	2025-07-15 11:11:11+00	dipudatos	Gutiérrez Valtierra Diana Estefanía	PAN	Guanajuato
218	2025-07-15 11:11:11+00	dipudatos	Guzmán Avilés María Del Rosario	PAN	Representación Proporcional
219	2025-07-15 11:11:11+00	dipudatos	Guzmán González Denisse	PVEM	Veracruz
220	2025-07-15 11:11:11+00	dipudatos	Haces Barba Pedro Miguel	Morena	Representación Proporcional
221	2025-07-15 11:11:11+00	dipudatos	Hernández Cerón Asael	PAN	Representación Proporcional
222	2025-07-15 11:11:11+00	dipudatos	Hernández García Laura	MC	Representación Proporcional
223	2025-07-15 11:11:11+00	dipudatos	Hernández Mirón Carlos	Morena	Ciudad de México
224	2025-07-15 11:11:11+00	dipudatos	Hernández Pérez César Agustín	Morena	México
225	2025-07-15 11:11:11+00	dipudatos	Hernández Pérez José Luis	PVEM	México
226	2025-07-15 11:11:11+00	dipudatos	Hernández Rodríguez Blanca Estela	PVEM	Veracruz
227	2025-07-15 11:11:11+00	dipudatos	Hernández Sáenz Claudia Alejandra	Morena	Tamaulipas
228	2025-07-15 11:11:11+00	dipudatos	Hernández Tapia Arturo Roberto	Morena	México
229	2025-07-15 11:11:11+00	dipudatos	Herrera Borunda Javier Octavio	PVEM	Representación Proporcional
230	2025-07-15 11:11:11+00	dipudatos	Herrera Natividad Olga Lidia	PT	Representación Proporcional
231	2025-07-15 11:11:11+00	dipudatos	Herrera Ruiz Gilberto	Morena	Querétaro
232	2025-07-15 11:11:11+00	dipudatos	Herrera Solórzano Gilberto	Morena	Baja California
233	2025-07-15 11:11:11+00	dipudatos	Herrera Villavicencio Mónica	Morena	Veracruz
234	2025-07-15 11:11:11+00	dipudatos	Higareda Segura Lucero	Morena	Guanajuato
235	2025-07-15 11:11:11+00	dipudatos	Higuera Esquer Alma Manuela	Morena	Sonora
236	2025-07-15 11:11:11+00	dipudatos	Hinojosa Pérez José Manuel	PAN	Representación Proporcional
237	2025-07-15 11:11:11+00	dipudatos	Huerta Romero Azucena	PVEM	México
238	2025-07-15 11:11:11+00	dipudatos	Huerta Villegas Genoveva	PAN	Representación Proporcional
239	2025-07-15 11:11:11+00	dipudatos	Ibarra Ramos Jesús Alfonso	Morena	Sinaloa
240	2025-07-15 11:11:11+00	dipudatos	Íñiguez Franco José Mario	PAN	Jalisco
241	2025-07-15 11:11:11+00	dipudatos	Jasso Nieto Ofelia Socorro	PRI	Representación Proporcional
242	2025-07-15 11:11:11+00	dipudatos	Jiménez Angulo Julia Licet	PAN	Representación Proporcional
243	2025-07-15 11:11:11+00	dipudatos	Jiménez Delgado Silvia Patricia	PAN	Durango
244	2025-07-15 11:11:11+00	dipudatos	Jiménez Godoy Gabriela Georgina	Morena	Ciudad de México
245	2025-07-15 11:11:11+00	dipudatos	Jiménez Vázquez Naty Poob Pijy	Morena	Oaxaca
246	2025-07-15 11:11:11+00	dipudatos	Jiménez Zamora Mariana Guadalupe	PAN	Representación Proporcional
247	2025-07-15 11:11:11+00	dipudatos	Juan Carlos Irma	Morena	Oaxaca
248	2025-07-15 11:11:11+00	dipudatos	Kalionchiz De la Fuente Theodoros	PAN	Coahuila
249	2025-07-15 11:11:11+00	dipudatos	Lara Calderón Emilio	PRI	Representación Proporcional
250	2025-07-15 11:11:11+00	dipudatos	Lastra Bastar Jaime Humberto	Morena	Tabasco
251	2025-07-15 11:11:11+00	dipudatos	León Rosas Rosalía	PT	Representación Proporcional
252	2025-07-15 11:11:11+00	dipudatos	Licerio Valdés Hilda Magdalena	PVEM	Coahuila
253	2025-07-15 11:11:11+00	dipudatos	Lixa Abimerhi José Elías	PAN	Representación Proporcional
254	2025-07-15 11:11:11+00	dipudatos	Lobo Román Víctor Hugo	Morena	Representación Proporcional
255	2025-07-15 11:11:11+00	dipudatos	Longoria López Paola Michell	MC	Representación Proporcional
256	2025-07-15 11:11:11+00	dipudatos	López Carrillo Vanessa	PT	Michoacán
257	2025-07-15 11:11:11+00	dipudatos	López De la Cruz Amalia	Morena	Representación Proporcional
258	2025-07-15 11:11:11+00	dipudatos	López Gorosave Rocío	Morena	Baja California
259	2025-07-15 11:11:11+00	dipudatos	López Hernández Mario Alberto	PVEM	Tamaulipas
260	2025-07-15 11:11:11+00	dipudatos	López Orozco Diana Isela	Morena	Representación Proporcional
261	2025-07-15 11:11:11+00	dipudatos	López Rabadán Kenia	PAN	Representación Proporcional
262	2025-07-15 11:11:11+00	dipudatos	López Ruiz José Antonio	PT	Puebla
263	2025-07-15 11:11:11+00	dipudatos	López Sánchez José Alejandro	PT	Oaxaca
264	2025-07-15 11:11:11+00	dipudatos	López Santiago Herminia	Morena	Representación Proporcional
265	2025-07-15 11:11:11+00	dipudatos	López Vela Jaime Genaro	Morena	Representación Proporcional
266	2025-07-15 11:11:11+00	dipudatos	Lozoya Santillán Jorge Alfredo	MC	Representación Proporcional
267	2025-07-15 11:11:11+00	dipudatos	Luévano Cantú María Soledad	Morena	Zacatecas
268	2025-07-15 11:11:11+00	dipudatos	Luna Ayala Noemi Berenice	PAN	Representación Proporcional
269	2025-07-15 11:11:11+00	dipudatos	Luna Vázquez Hugo Manuel	MC	Representación Proporcional
270	2025-07-15 11:11:11+00	dipudatos	Madrazo Silva Carlos Arturo	PVEM	Ciudad de México
271	2025-07-15 11:11:11+00	dipudatos	Madrid Pérez Ricardo	PVEM	Representación Proporcional
272	2025-07-15 11:11:11+00	dipudatos	Maldonado Chavarín Alberto	Morena	Jalisco
273	2025-07-15 11:11:11+00	dipudatos	Manzanilla Téllez Emilio	PT	México
274	2025-07-15 11:11:11+00	dipudatos	Marín Rangel Iván	PVEM	México
275	2025-07-15 11:11:11+00	dipudatos	Márquez Alcalá Laura Cristina	PAN	Guanajuato
276	2025-07-15 11:11:11+00	dipudatos	Márquez Becerra Alan Sahir	PAN	Representación Proporcional
277	2025-07-15 11:11:11+00	dipudatos	Martínez Álvarez Elizabeth	PAN	Representación Proporcional
278	2025-07-15 11:11:11+00	dipudatos	Martínez Cázares Germán	PAN	Representación Proporcional
279	2025-07-15 11:11:11+00	dipudatos	Martínez García Verónica	PRI	Representación Proporcional
280	2025-07-15 11:11:11+00	dipudatos	Martínez López Paulo Gonzalo	PAN	Aguascalientes
281	2025-07-15 11:11:11+00	dipudatos	Martínez Montaño Karina Isabel	Morena	Representación Proporcional
282	2025-07-15 11:11:11+00	dipudatos	Martínez Ruiz Maribel	PT	Representación Proporcional
283	2025-07-15 11:11:11+00	dipudatos	Martínez Terrazas Víctor Adrián	PAN	Representación Proporcional
284	2025-07-15 11:11:11+00	dipudatos	Martínez Ventura Luis Enrique	PT	México
285	2025-07-15 11:11:11+00	dipudatos	Mayer Bretón Sergio	Morena	Representación Proporcional
286	2025-07-15 11:11:11+00	dipudatos	Mejía Berdeja Ricardo Sóstenes	PT	Representación Proporcional
287	2025-07-15 11:11:11+00	dipudatos	Mejía Haro Ulises	Morena	Zacatecas
288	2025-07-15 11:11:11+00	dipudatos	Meléndez Ortega Juan Antonio	PRI	Chihuahua
289	2025-07-15 11:11:11+00	dipudatos	Mendoza Arce Fernando	Morena	Representación Proporcional
290	2025-07-15 11:11:11+00	dipudatos	Mendoza Arias Guadalupe Araceli	Ind.	Michoacán
291	2025-07-15 11:11:11+00	dipudatos	Mendoza Mondragón María Luisa	PVEM	México
292	2025-07-15 11:11:11+00	dipudatos	Mendoza Ramírez Eunice Abigail	Morena	Representación Proporcional
293	2025-07-15 11:11:11+00	dipudatos	Mendoza Ruiz Jacobo	Morena	Sonora
294	2025-07-15 11:11:11+00	dipudatos	Mercado Castro Patricia	MC	Representación Proporcional
295	2025-07-15 11:11:11+00	dipudatos	Merino Escamilla Nora Yessica	PT	Puebla
296	2025-07-15 11:11:11+00	dipudatos	Michel López Marcela	Morena	Jalisco
297	2025-07-15 11:11:11+00	dipudatos	Mier Acolt Jorge Alberto	Morena	Veracruz
298	2025-07-15 11:11:11+00	dipudatos	Mier Bañuelos Carlos Ignacio	Morena	Puebla
299	2025-07-15 11:11:11+00	dipudatos	Millán Contreras Iván	Morena	México
300	2025-07-15 11:11:11+00	dipudatos	Milland Pérez Beatriz	Morena	Tabasco
302	2025-07-15 11:11:11+00	dipudatos	Mollinedo Cano Tey	Morena	Tabasco
303	2025-07-15 11:11:11+00	dipudatos	Monraz Ibarra Miguel Ángel	PAN	Representación Proporcional
304	2025-07-15 11:11:11+00	dipudatos	Monreal Ávila Ricardo	Morena	Representación Proporcional
305	2025-07-15 11:11:11+00	dipudatos	Montalvo Luna José Luis	PT	México
306	2025-07-15 11:11:11+00	dipudatos	Montemayor Castillo Santy	Morena	Representación Proporcional
307	2025-07-15 11:11:11+00	dipudatos	Mora Eguiluz Celeste	Morena	Guerrero
308	2025-07-15 11:11:11+00	dipudatos	Morales Mendoza Gabino	Morena	Representación Proporcional
309	2025-07-15 11:11:11+00	dipudatos	Morales Rubio María Guadalupe	Morena	Representación Proporcional
310	2025-07-15 11:11:11+00	dipudatos	Morán Sánchez Leoncio Alfonso	Morena	Colima
311	2025-07-15 11:11:11+00	dipudatos	Moreira Valdez Rubén Ignacio	PRI	Representación Proporcional
312	2025-07-15 11:11:11+00	dipudatos	Morelos Rodríguez Carlos	PT	Chiapas
313	2025-07-15 11:11:11+00	dipudatos	Moreno De Haro Juan	PRI	Representación Proporcional
314	2025-07-15 11:11:11+00	dipudatos	Moreno Guerra Evangelina	Morena	Baja California
315	2025-07-15 11:11:11+00	dipudatos	Moreno Hernández Brígido Ramiro	PT	Coahuila
316	2025-07-15 11:11:11+00	dipudatos	Moreno Méndez Dora Alicia	Morena	Representación Proporcional
317	2025-07-15 11:11:11+00	dipudatos	Moreno Ramírez Claudia Lisbeth	Morena	Baja California
318	2025-07-15 11:11:11+00	dipudatos	Moreno Rivera Julio César	Morena	Representación Proporcional
319	2025-07-15 11:11:11+00	dipudatos	Moreno Villatoro Rosario del Carmen	Morena	Chiapas
320	2025-07-15 11:11:11+00	dipudatos	Moya Bastón Martha Amalia	PAN	México
321	2025-07-15 11:11:11+00	dipudatos	Muñiz Cabrera Kenia Gisell	Morena	Representación Proporcional
322	2025-07-15 11:11:11+00	dipudatos	Muñoz Moreno Anayeli	MC	Representación Proporcional
323	2025-07-15 11:11:11+00	dipudatos	Murguía Lardizabal Daniel	Morena	Chihuahua
324	2025-07-15 11:11:11+00	dipudatos	Nader Nasrallah Jesús Antonio	PAN	Tamaulipas
325	2025-07-15 11:11:11+00	dipudatos	Narro Céspedes José	Morena	Representación Proporcional
326	2025-07-15 11:11:11+00	dipudatos	Narro Panameño Blanca Araceli	Morena	Tamaulipas
327	2025-07-15 11:11:11+00	dipudatos	Nava García María Del Carmen	PVEM	Guerrero
328	2025-07-15 11:11:11+00	dipudatos	Navarrete Rivera Alma Delia	Morena	México
329	2025-07-15 11:11:11+00	dipudatos	Navarro Acevedo Nadia	PRI	Representación Proporcional
330	2025-07-15 11:11:11+00	dipudatos	Navarro Pérez Beatriz Andrea	Morena	Nayarit
331	2025-07-15 11:11:11+00	dipudatos	Niño de Rivera Vela Homero Ricardo	PAN	Nuevo León
332	2025-07-15 11:11:11+00	dipudatos	Noyola Cervantes Ma. Leonor	PVEM	Representación Proporcional
333	2025-07-15 11:11:11+00	dipudatos	Núñez Aguilar Ernesto	PVEM	Michoacán
334	2025-07-15 11:11:11+00	dipudatos	Núñez Monreal Magdalena del Socorro	PT	Representación Proporcional
335	2025-07-15 11:11:11+00	dipudatos	Núñez Sánchez Gloria Elizabeth	MC	Representación Proporcional
336	2025-07-15 11:11:11+00	dipudatos	Olguín Díaz Nancy Aracely	PAN	Representación Proporcional
337	2025-07-15 11:11:11+00	dipudatos	Olguín Serna Julia Arcelia	Morena	Zacatecas
338	2025-07-15 11:11:11+00	dipudatos	Olivares Castañeda Amparo Lilia	PAN	Nuevo León
339	2025-07-15 11:11:11+00	dipudatos	Olivares Cerda Arturo	Morena	Representación Proporcional
340	2025-07-15 11:11:11+00	dipudatos	Olivares Mejía Gerardo	PT	Guerrero
341	2025-07-15 11:11:11+00	dipudatos	Oliver Cen Luis Arturo	Morena	Representación Proporcional
342	2025-07-15 11:11:11+00	dipudatos	Orozco Caballero María del Rosario	Morena	Puebla
343	2025-07-15 11:11:11+00	dipudatos	Ortega Pacheco Ivonne Aracely	MC	Representación Proporcional
344	2025-07-15 11:11:11+00	dipudatos	Ortega Tiburcio Rosa Guadalupe	Morena	Michoacán
345	2025-07-15 11:11:11+00	dipudatos	Ortiz González Graciela	PRI	Representación Proporcional
346	2025-07-15 11:11:11+00	dipudatos	Ortiz Pérez Liliana	PAN	Representación Proporcional
347	2025-07-15 11:11:11+00	dipudatos	Ortiz Rodríguez Jorge Armando	PT	Nayarit
348	2025-07-15 11:11:11+00	dipudatos	Oseguera Kernion Adrián	Morena	Representación Proporcional
349	2025-07-15 11:11:11+00	dipudatos	Osorio Ferral Bertha	Morena	Representación Proporcional
350	2025-07-15 11:11:11+00	dipudatos	P. Ángeles Moreno Tatiana Tonantzin	Morena	Hidalgo
351	2025-07-15 11:11:11+00	dipudatos	Padierna Luna María de los Dolores	Morena	Ciudad de México
352	2025-07-15 11:11:11+00	dipudatos	Palacios Kuri Tania	PAN	Representación Proporcional
353	2025-07-15 11:11:11+00	dipudatos	Palacios Medina Sandra Patricia	Morena	Nuevo León
354	2025-07-15 11:11:11+00	dipudatos	Palacios Rodríguez Carlos Ventura	Morena	Representación Proporcional
355	2025-07-15 11:11:11+00	dipudatos	Palma César Víctor Samuel	PRI	Representación Proporcional
356	2025-07-15 11:11:11+00	dipudatos	Palomar González Mayra Dolores	Morena	Representación Proporcional
357	2025-07-15 11:11:11+00	dipudatos	Pedroza Jiménez Héctor	PVEM	Representación Proporcional
358	2025-07-15 11:11:11+00	dipudatos	Pelayo Covarrubias Francisco	PAN	Representación Proporcional
359	2025-07-15 11:11:11+00	dipudatos	Peña Vidal Iván	Morena	Tabasco
360	2025-07-15 11:11:11+00	dipudatos	Peña Villa José Alejandro	Morena	Representación Proporcional
361	2025-07-15 11:11:11+00	dipudatos	Perea Cruz Jesús Irugami	Morena	Ciudad de México
362	2025-07-15 11:11:11+00	dipudatos	Pérez Bernabe Jaime Humberto	Morena	Veracruz
363	2025-07-15 11:11:11+00	dipudatos	Pérez Cuéllar Alejandro	PVEM	Chihuahua
364	2025-07-15 11:11:11+00	dipudatos	Pérez Díaz Víctor Manuel	PAN	Representación Proporcional
365	2025-07-15 11:11:11+00	dipudatos	Pérez Gabino Gildardo	MC	Representación Proporcional
366	2025-07-15 11:11:11+00	dipudatos	Pérez Herrera Verónica	PAN	Representación Proporcional
367	2025-07-15 11:11:11+00	dipudatos	Pérez Popoca María Fabiola Karina	Morena	Puebla
368	2025-07-15 11:11:11+00	dipudatos	Pérez Jaen Zermeño María Elena	PAN	Aguascalientes
369	2025-07-15 11:11:11+00	dipudatos	Piceno Navarro Estela Carina	Morena	Ciudad de México
370	2025-07-15 11:11:11+00	dipudatos	Piñón Rivera Lorena	PRI	Representación Proporcional
371	2025-07-15 11:11:11+00	dipudatos	Polanco Morales Aniceto	Morena	Representación Proporcional
372	2025-07-15 11:11:11+00	dipudatos	Pompa Robles Felicita	Morena	Sinaloa
373	2025-07-15 11:11:11+00	dipudatos	Porras Baylón Any Marilú	Morena	Nayarit
374	2025-07-15 11:11:11+00	dipudatos	Prieto Gallardo Ernesto Alejandro	Morena	Guanajuato
375	2025-07-15 11:11:11+00	dipudatos	Puente Salas Carlos Alberto	PVEM	Representación Proporcional
376	2025-07-15 11:11:11+00	dipudatos	Puertos Chimalhua Jonathan	PVEM	Veracruz
377	2025-07-15 11:11:11+00	dipudatos	Pujol Irastorza Jesús Antonio	Morena	Sonora
378	2025-07-15 11:11:11+00	dipudatos	Quiñones Garrido Claudia	PAN	Representación Proporcional
379	2025-07-15 11:11:11+00	dipudatos	Quiroga Treviño Luis Orlando	PVEM	Nuevo León
380	2025-07-15 11:11:11+00	dipudatos	Quiroz Gallegos Adriana Belinda	Morena	Nuevo León
381	2025-07-15 11:11:11+00	dipudatos	Ramírez Barba Éctor Jaime	PAN	Guanajuato
382	2025-07-15 11:11:11+00	dipudatos	Ramírez Cisneros Jessica	Morena	Veracruz
383	2025-07-15 11:11:11+00	dipudatos	Ramírez Cuéllar Alfonso	Morena	Representación Proporcional
384	2025-07-15 11:11:11+00	dipudatos	Ramírez Guzmán Emilio Ramón	Morena	Chiapas
385	2025-07-15 11:11:11+00	dipudatos	Ramírez Ramos Antonio de Jesús	PVEM	Jalisco
386	2025-07-15 11:11:11+00	dipudatos	Ramírez Reyes Gibrán	MC	Representación Proporcional
387	2025-07-15 11:11:11+00	dipudatos	Rejón Lara Ariana del Rocío	PRI	Representación Proporcional
388	2025-07-15 11:11:11+00	dipudatos	Rementería Del Puerto Julen	PAN	Representación Proporcional
389	2025-07-15 11:11:11+00	dipudatos	Rendón García César Augusto	PAN	Representación Proporcional
390	2025-07-15 11:11:11+00	dipudatos	Rendón Gómez Juan Guillermo	Morena	Ciudad de México
391	2025-07-15 11:11:11+00	dipudatos	Reyes De la Torre Irais Virginia	MC	Representación Proporcional
392	2025-07-15 11:11:11+00	dipudatos	Rincón Chanona Sonia	Morena	Representación Proporcional
393	2025-07-15 11:11:11+00	dipudatos	Rivera Vivanco Claudia	Morena	Puebla
394	2025-07-15 11:11:11+00	dipudatos	Rodríguez Barroso Diego Ángel	PAN	Guanajuato
395	2025-07-15 11:11:11+00	dipudatos	Rodríguez Heredia María Isabel	PAN	Yucatán
396	2025-07-15 11:11:11+00	dipudatos	Rodríguez Pérez Luz María	Morena	Representación Proporcional
397	2025-07-15 11:11:11+00	dipudatos	Rodríguez Torres Luis Agustín	PAN	Representación Proporcional
398	2025-07-15 11:11:11+00	dipudatos	Rojo Pimentel Ana Karina	PT	Ciudad de México
399	2025-07-15 11:11:11+00	dipudatos	Romero Gómez Petra	Morena	Representación Proporcional
400	2025-07-15 11:11:11+00	dipudatos	Rosales Cruz María Magdalena	Morena	Guanajuato
401	2025-07-15 11:11:11+00	dipudatos	Rosete Sánchez María de Jesús	Morena	Representación Proporcional
402	2025-07-15 11:11:11+00	dipudatos	Rubalcava Jiménez José Alfonso	PAN	Representación Proporcional
403	2025-07-15 11:11:11+00	dipudatos	Rubio Fernández Paulina	PAN	Representación Proporcional
404	2025-07-15 11:11:11+00	dipudatos	Rubio Sánchez Mirna María de la Luz	Morena	Hidalgo
405	2025-07-15 11:11:11+00	dipudatos	Ruiz Hernández Juan Armando	MC	Representación Proporcional
406	2025-07-15 11:11:11+00	dipudatos	Ruiz López Alma Laura	Morena	Baja California
407	2025-07-15 11:11:11+00	dipudatos	Ruiz Moreno Laura Ivonne	PRI	Representación Proporcional
408	2025-07-15 11:11:11+00	dipudatos	Ruiz Páez Montserrat	Morena	México
409	2025-07-15 11:11:11+00	dipudatos	Ruiz Massieu Salinas Claudia	MC	Representación Proporcional
410	2025-07-15 11:11:11+00	dipudatos	Saiden Quiroz Jessica	Morena	Yucatán
411	2025-07-15 11:11:11+00	dipudatos	Salas Rodríguez Claudia Gabriela	MC	Representación Proporcional
412	2025-07-15 11:11:11+00	dipudatos	Salgado Ponce Magda Erika	Morena	Representación Proporcional
413	2025-07-15 11:11:11+00	dipudatos	Salgado Vázquez Rigoberto	Morena	Ciudad de México
414	2025-07-15 11:11:11+00	dipudatos	Salim Alle Miguel Ángel	PAN	Guanajuato
415	2025-07-15 11:11:11+00	dipudatos	Salomón Durán Ciria Yamile	PVEM	Hidalgo
416	2025-07-15 11:11:11+00	dipudatos	Samperio Montaño Juan Ignacio	MC	Representación Proporcional
417	2025-07-15 11:11:11+00	dipudatos	Sánchez Arredondo Nancy Guadalupe	Morena	Baja California
418	2025-07-15 11:11:11+00	dipudatos	Sánchez Barrios Carlos	Morena	Guerrero
419	2025-07-15 11:11:11+00	dipudatos	Sánchez Cervantes Francisco Javier	Morena	Ciudad de México
420	2025-07-15 11:11:11+00	dipudatos	Sánchez González José Luis	PT	Jalisco
421	2025-07-15 11:11:11+00	dipudatos	Sánchez Juárez Claudia	PVEM	México
422	2025-07-15 11:11:11+00	dipudatos	Sánchez López Gloria	Morena	Oaxaca
423	2025-07-15 11:11:11+00	dipudatos	Sánchez Reyes Jorge Luis	Morena	Yucatán
424	2025-07-15 11:11:11+00	dipudatos	Sánchez Rivera Miguel Ángel	MC	Representación Proporcional
425	2025-07-15 11:11:11+00	dipudatos	Sánchez Rodríguez Ernesto	PAN	Representación Proporcional
426	2025-07-15 11:11:11+00	dipudatos	Sánchez Sánchez Luis Gerardo	PRI	Guanajuato
427	2025-07-15 11:11:11+00	dipudatos	Sánchez Cordero Dávila Olga María del Carmen	Morena	Representación Proporcional
428	2025-07-15 11:11:11+00	dipudatos	Sandoval Flores Reginaldo	PT	Representación Proporcional
429	2025-07-15 11:11:11+00	dipudatos	Sandoval Hernández Mónica Elizabeth	PRI	Ciudad de México
430	2025-07-15 11:11:11+00	dipudatos	Santana González Ana Erika	PVEM	Representación Proporcional
431	2025-07-15 11:11:11+00	dipudatos	Santander Soto Gissel	Morena	Puebla
432	2025-07-15 11:11:11+00	dipudatos	Santiago Pineda Wblester	PT	México
433	2025-07-15 11:11:11+00	dipudatos	Santiago Rodríguez Guillermo Rafael	Morena	Chiapas
434	2025-07-15 11:11:11+00	dipudatos	Savala Díaz Rosalinda	Morena	Representación Proporcional
435	2025-07-15 11:11:11+00	dipudatos	Scherer Pareyón Julio Javier	PVEM	Representación Proporcional
436	2025-07-15 11:11:11+00	dipudatos	Segura Trejo Elena Edith	Morena	Ciudad de México
437	2025-07-15 11:11:11+00	dipudatos	Sepúlveda García Nadia Yadira	Morena	Representación Proporcional
438	2025-07-15 11:11:11+00	dipudatos	Shember Domínguez Delhi Miroslava	Morena	Michoacán
439	2025-07-15 11:11:11+00	dipudatos	Sibaja Mendoza Aciel	Morena	Representación Proporcional
440	2025-07-15 11:11:11+00	dipudatos	Silva Andraca Ruth Maricela	PVEM	Ciudad de México
441	2025-07-15 11:11:11+00	dipudatos	Silva Santiago María Damaris	Morena	Representación Proporcional
442	2025-07-15 11:11:11+00	dipudatos	Solache González Maribel	Morena	Representación Proporcional
443	2025-07-15 11:11:11+00	dipudatos	Sosa Pichardo Roberto	PAN	Querétaro
444	2025-07-15 11:11:11+00	dipudatos	Suárez Licona Emilio	PRI	Representación Proporcional
445	2025-07-15 11:11:11+00	dipudatos	Suárez Montes de Oca Roselia	Morena	Representación Proporcional
446	2025-07-15 11:11:11+00	dipudatos	Taja Ramírez Javier	Morena	Guerrero
447	2025-07-15 11:11:11+00	dipudatos	Tejeda Cid Armando	PAN	Representación Proporcional
448	2025-07-15 11:11:11+00	dipudatos	Téllez Hernández Héctor Saúl	PAN	Ciudad de México
449	2025-07-15 11:11:11+00	dipudatos	Téllez Marín José Luis	PT	Michoacán
450	2025-07-15 11:11:11+00	dipudatos	Tenorio Adame Paola	Morena	Veracruz
451	2025-07-15 11:11:11+00	dipudatos	Torres Cofiño Marcelo de Jesús	PAN	Representación Proporcional
452	2025-07-15 11:11:11+00	dipudatos	Torres Graciano Fernando	PAN	Guanajuato
453	2025-07-15 11:11:11+00	dipudatos	Trujillo Trujillo Karina Alejandra	PVEM	Representación Proporcional
454	2025-07-15 11:11:11+00	dipudatos	Ulloa Pérez Gerardo	Morena	México
455	2025-07-15 11:11:11+00	dipudatos	Urbina Castañeda Rosa Irene	Morena	Chiapas
456	2025-07-15 11:11:11+00	dipudatos	Valdepeñas González Gabriela	Morena	México
457	2025-07-15 11:11:11+00	dipudatos	Valdés Peña Jesús	Morena	Representación Proporcional
458	2025-07-15 11:11:11+00	dipudatos	Valencia de la Mora Gricelda	Morena	Colima
459	2025-07-15 11:11:11+00	dipudatos	Valladares Eichelmann Juan Carlos	PVEM	San Luis Potosí
460	2025-07-15 11:11:11+00	dipudatos	Varela Domínguez Juan Carlos	Morena	México
461	2025-07-15 11:11:11+00	dipudatos	Vargas Meraz Teresita de Jesús	Morena	Chihuahua
462	2025-07-15 11:11:11+00	dipudatos	Vásquez Hernández Eva María	PAN	Representación Proporcional
463	2025-07-15 11:11:11+00	dipudatos	Vázquez Adasa Saray	Morena	Representación Proporcional
464	2025-07-15 11:11:11+00	dipudatos	Vázquez Ahued Pablo	MC	Representación Proporcional
465	2025-07-15 11:11:11+00	dipudatos	Vázquez Alatorre Antares Guadalupe	Morena	Representación Proporcional
466	2025-07-15 11:11:11+00	dipudatos	Vázquez Arellano Manuel	Morena	Representación Proporcional
467	2025-07-15 11:11:11+00	dipudatos	Vázquez Calixto Francisco Javier	PT	Representación Proporcional
468	2025-07-15 11:11:11+00	dipudatos	Vázquez Conchas Raymundo	Morena	Tlaxcala
469	2025-07-15 11:11:11+00	dipudatos	Vázquez García Dionicia	Morena	México
470	2025-07-15 11:11:11+00	dipudatos	Vázquez González Pedro	PT	Representación Proporcional
471	2025-07-15 11:11:11+00	dipudatos	Vázquez Jiménez Alonso de Jesús	PAN	Jalisco
472	2025-07-15 11:11:11+00	dipudatos	Vázquez Navarro Enrique	Morena	Representación Proporcional
473	2025-07-15 11:11:11+00	dipudatos	Vázquez Ruiz Miriam de los Ángeles	Morena	Oaxaca
474	2025-07-15 11:11:11+00	dipudatos	Vázquez Vázquez Alfredo	Morena	Chiapas
475	2025-07-15 11:11:11+00	dipudatos	Vega Regalado José Adalberto	PVEM	Nuevo León
476	2025-07-15 11:11:11+00	dipudatos	Velazco Bautista Aremy	Morena	San Luis Potosí
477	2025-07-15 11:11:11+00	dipudatos	Velázquez Vallejo Francisco Javier	Morena	Veracruz
478	2025-07-15 11:11:11+00	dipudatos	Velázquez Vázquez Marcela	Morena	Michoacán
479	2025-07-15 11:11:11+00	dipudatos	Vences Valencia Julieta Kristal	Morena	Representación Proporcional
480	2025-07-15 11:11:11+00	dipudatos	Verástegui Ostos César Augusto	PAN	Representación Proporcional
481	2025-07-15 11:11:11+00	dipudatos	Vilchis Contreras Luis Fernando	PT	México
482	2025-07-15 11:11:11+00	dipudatos	Villacis Palacios Zoraya	Morena	Veracruz
483	2025-07-15 11:11:11+00	dipudatos	Villalpando Riquelme Julieta	Morena	México
484	2025-07-15 11:11:11+00	dipudatos	Villanueva Moo Jazmín Yaneli	Morena	Yucatán
485	2025-07-15 11:11:11+00	dipudatos	Villarreal Solís Gerardo	PVEM	Durango
486	2025-07-15 11:11:11+00	dipudatos	Villatoro Osorio Jorge Luis	PVEM	Chiapas
487	2025-07-15 11:11:11+00	dipudatos	Villegas Canché Freyda Marybel	Morena	Quintana Roo
488	2025-07-15 11:11:11+00	dipudatos	Villegas García Isidro Enrique	Morena	Veracruz
489	2025-07-15 11:11:11+00	dipudatos	Villegas Guarneros Dulce María Corina	Morena	Veracruz
490	2025-07-15 11:11:11+00	dipudatos	Villegas Sánchez Merary	Morena	Sinaloa
491	2025-07-15 11:11:11+00	dipudatos	Vitela Rodríguez Alma Marina	Morena	Representación Proporcional
492	2025-07-15 11:11:11+00	dipudatos	Winkler Trujillo Cindy	PVEM	Morelos
493	2025-07-15 11:11:11+00	dipudatos	Yáñez Cuéllar Arturo	PRI	Representación Proporcional
494	2025-07-15 11:11:11+00	dipudatos	Zagal Ramírez Xochitl Nashielly	Morena	México
495	2025-07-15 11:11:11+00	dipudatos	Zamora Gastélum Mario	PRI	Representación Proporcional
496	2025-07-15 11:11:11+00	dipudatos	Zavala Gómez del Campo Margarita Ester	PAN	Ciudad de México
497	2025-07-15 11:11:11+00	dipudatos	Zavala Gutiérrez Juan Ignacio	MC	Representación Proporcional
498	2025-07-15 11:11:11+00	dipudatos	Zebadúa Alva Joaquín	Morena	Chiapas
499	2025-07-15 11:11:11+00	dipudatos	Zenteno Santaella Pedro Mario	Morena	México
500	2025-07-15 11:11:11+00	dipudatos	Zúñiga Cerón Marisela	Morena	Ciudad de México
501	2025-07-18 01:52:53.57903+00	dipudatos	Ortega Pacheco Ivonne Aracelly	MC	Representación Proporcional
630	2025-07-15 11:11:11+00	senado	Aguilar Castillo Heriberto Marcelo	Morena	Sonora
631	2025-07-15 11:11:11+00	senado	Álvarez Lima José Antonio Cruz	Morena	Tlaxcala
632	2025-07-15 11:11:11+00	senado	Anaya Cortés Ricardo	PAN	Representación Proporcional
633	2025-07-15 11:11:11+00	senado	Anaya Gutiérrez Alberto	PT	Representación Proporcional
634	2025-07-15 11:11:11+00	senado	Anaya Mota Claudia Edith	PRI	Zacatecas
635	2025-07-15 11:11:11+00	senado	Angulo Briceño Pablo Guillermo	PRI	Representación Proporcional
636	2025-07-15 11:11:11+00	senado	Añorve Baños Manuel	PRI	Guerrero
637	2025-07-15 11:11:11+00	senado	Arias Trevilla Alejandra Berenice	Morena	Tabasco
638	2025-07-15 11:11:11+00	senado	Ascencio Ortega Reyna Celeste	Morena	Michoacán
639	2025-07-15 11:11:11+00	senado	Ávalos Zempoalteca Anabell	PRI	Tlaxcala
640	2025-07-15 11:11:11+00	senado	Ayala Robles Armando	Morena	Baja California
641	2025-07-15 11:11:11+00	senado	Bañuelos de la Torre Geovanna del Carmen	PT	Representación Proporcional
642	2025-07-15 11:11:11+00	senado	Barrales Magdaleno María Alejandra	MC	Representación Proporcional
643	2025-07-15 11:11:11+00	senado	Barreda Pavón Francisco Daniel	MC	Campeche
644	2025-07-15 11:11:11+00	senado	Bonilla Herrera Raquel	Morena	Veracruz
645	2025-07-15 11:11:11+00	senado	Bugarín Rodríguez Jasmine María	PVEM	Nayarit
646	2025-07-15 11:11:11+00	senado	Camarillo Medina Néstor	PRI	Puebla
647	2025-07-15 11:11:11+00	senado	Camino Farjat Verónica Noemí	Morena	Yucatán
648	2025-07-15 11:11:11+00	senado	Campuzano González Gina Gerardina	PAN	Durango
649	2025-07-15 11:11:11+00	senado	Cantón Zetina Óscar	Morena	Tabasco
650	2025-07-15 11:11:11+00	senado	Castañeda Hoeflich José Clemente	MC	Representación Proporcional
651	2025-07-15 11:11:11+00	senado	Castillo Juárez Laura Itzel	Morena	Representación Proporcional
652	2025-07-15 11:11:11+00	senado	Castrejón Trujillo Karen	PVEM	Ciudad de México
653	2025-07-15 11:11:11+00	senado	Castro Castro Imelda	Morena	Sinaloa
654	2025-07-15 11:11:11+00	senado	Cepeda Salas Alfonso	Morena	Representación Proporcional
655	2025-07-15 11:11:11+00	senado	Chávez Treviño Andrea	Morena	Chihuahua
656	2025-07-15 11:11:11+00	senado	Chavira De La Rosa María Guadalupe	Morena	Representación Proporcional
657	2025-07-15 11:11:11+00	senado	Chíguil Figueroa Francisco	Morena	Ciudad de México
658	2025-07-15 11:11:11+00	senado	Colosio Riojas Luis Donaldo	MC	Nuevo León
659	2025-07-15 11:11:11+00	senado	Corona Nakamura María del Rocío	PVEM	Jalisco
660	2025-07-15 11:11:11+00	senado	Corral Jurado Javier	Morena	Representación Proporcional
661	2025-07-15 11:11:11+00	senado	Cortés García Luisa	Morena	Oaxaca
662	2025-07-15 11:11:11+00	senado	Cortés Mendoza Marko Antonio	PAN	Representación Proporcional
663	2025-07-15 11:11:11+00	senado	Cruz Castellanos José Manuel	Morena	Chiapas
664	2025-07-15 11:11:11+00	senado	Davis Castro Homero	Morena	Baja California Sur
665	2025-07-15 11:11:11+00	senado	De León Villard Sasil Dora Luz	Morena	Chiapas
666	2025-07-15 11:11:11+00	senado	Díaz Delgado Blanca Judith	Morena	Nuevo León
667	2025-07-15 11:11:11+00	senado	Díaz Marmolejo María de Jesús	PAN	Aguascalientes
668	2025-07-15 11:11:11+00	senado	Díaz Robles Verónica del Carmen	Morena	Zacatecas
669	2025-07-15 11:11:11+00	senado	Dorantes Lámbarri Agustín	PAN	Querétaro
670	2025-07-15 11:11:11+00	senado	Esquer Verdugo Rosario Alejandro	Morena	Representación Proporcional
671	2025-07-15 11:11:11+00	senado	Esquivel Torres Laura	PAN	Representación Proporcional
672	2025-07-15 11:11:11+00	senado	Estrada Mauro Laura	Morena	Oaxaca
673	2025-07-15 11:11:11+00	senado	Falcón Venegas Sandra Luz	Morena	México
674	2025-07-15 11:11:11+00	senado	Fernández González Waldo	PVEM	Nuevo León
675	2025-07-15 11:11:11+00	senado	Fernández Noroña José Gerardo Rodolfo	Morena	Representación Proporcional
676	2025-07-15 11:11:11+00	senado	García Medina Amalia Dolores	MC	Representación Proporcional
677	2025-07-15 11:11:11+00	senado	García Yáñez Ángel	PRI	Morelos
678	2025-07-15 11:11:11+00	senado	Gómez Leal José Ramón	Morena	Tamaulipas
679	2025-07-15 11:11:11+00	senado	González Hernández Alma Anahí	Morena	Quintana Roo
680	2025-07-15 11:11:11+00	senado	González Márquez Karen Michel	PAN	Representación Proporcional
681	2025-07-15 11:11:11+00	senado	González Silva Ruth Miriam	PVEM	San Luis Potosí
682	2025-07-15 11:11:11+00	senado	González Yáñez Alejandro	PT	Durango
683	2025-07-15 11:11:11+00	senado	Guadiana Mandujano Cecilia Guadalupe	Morena	Coahuila
684	2025-07-15 11:11:11+00	senado	Guerra Mena Juanita	PVEM	Morelos
685	2025-07-15 11:11:11+00	senado	Gutiérrez Escalante Mariela	Morena	México
686	2025-07-15 11:11:11+00	senado	Harp Iturribarría Susana	Morena	Representación Proporcional
687	2025-07-15 11:11:11+00	senado	Hernández Aceves Ana Karen	PT	Colima
688	2025-07-15 11:11:11+00	senado	Hernández Villafuerte Gilberto	PVEM	San Luis Potosí
689	2025-07-15 11:11:11+00	senado	Herrera Dagdug José Sabino	Morena	Tabasco
690	2025-07-15 11:11:11+00	senado	Huerta Ladrón de Guevara Manuel Rafael	Morena	Veracruz
691	2025-07-15 11:11:11+00	senado	Inzunza Cázarez Enrique	Morena	Sinaloa
692	2025-07-15 11:11:11+00	senado	Jaimes Archundia Erik Iván	Sin Partido	Sonora
693	2025-07-15 11:11:11+00	senado	Jarero Velázquez Miguel Pavel	Morena	Nayarit
694	2025-07-15 11:11:11+00	senado	Kantún Can María Martina	Morena	Campeche
695	2025-07-15 11:11:11+00	senado	Loera De La Rosa Juan Carlos	Morena	Chihuahua
696	2025-07-15 11:11:11+00	senado	Lomelí Bolaños Carlos	Morena	Jalisco
697	2025-07-15 11:11:11+00	senado	López Castro Cynthia Iliana	Morena	Ciudad de México
698	2025-07-15 11:11:11+00	senado	López Hernández Adán Augusto	Morena	Representación Proporcional
699	2025-07-15 11:11:11+00	senado	López Hernández Edith	Morena	Representación Proporcional
700	2025-07-15 11:11:11+00	senado	Magaña Fonseca Virginia Marie	PVEM	Guanajuato
701	2025-07-15 11:11:11+00	senado	Márquez Márquez Miguel	PAN	Guanajuato
702	2025-07-15 11:11:11+00	senado	Martín del Campo Martín del Campo Juan Antonio	PAN	Aguascalientes
703	2025-07-15 11:11:11+00	senado	Martínez Simón Mayuli Latifa	PAN	Quintana Roo
704	2025-07-15 11:11:11+00	senado	Melgar Bravo Luis Armando	PVEM	Chiapas
705	2025-07-15 11:11:11+00	senado	Mendoza Amezcua Virgilio	PVEM	Colima
706	2025-07-15 11:11:11+00	senado	Mercado Salgado Víctor Aureliano	Morena	Morelos
707	2025-07-15 11:11:11+00	senado	Micher Camarena Martha Lucía	Morena	Representación Proporcional
708	2025-07-15 11:11:11+00	senado	Mier Velazco Moisés Ignacio	Morena	Puebla
709	2025-07-15 11:11:11+00	senado	Mojica Morga Beatriz	Morena	Guerrero
710	2025-07-15 11:11:11+00	senado	Monreal Ávila Saúl	Morena	Zacatecas
711	2025-07-15 11:11:11+00	senado	Morales Toledo Antonino	Morena	Oaxaca
712	2025-07-15 11:11:11+00	senado	Moreno Cárdenas Rafael Alejandro	PRI	Representación Proporcional
713	2025-07-15 11:11:11+00	senado	Morón Orozco Raúl	Morena	Michoacán
714	2025-07-15 11:11:11+00	senado	Murat Hinojosa Alejandro Ismael	Morena	Representación Proporcional
715	2025-07-15 11:11:11+00	senado	Murguía Gutiérrez María Guadalupe	PAN	Querétaro
716	2025-07-15 11:11:11+00	senado	Ochoa Fernández Cuauhtémoc	Morena	Hidalgo
717	2025-07-15 11:11:11+00	senado	Olvera Bautista Sandra Simey	Morena	Hidalgo
718	2025-07-15 11:11:11+00	senado	Ortiz Domínguez Maki Esther	PVEM	Representación Proporcional
719	2025-07-15 11:11:11+00	senado	Ostoa Ortega Aníbal	Morena	Campeche
720	2025-07-15 11:11:11+00	senado	Polevnsky Gurwitz Yeidckol	PT	Representación Proporcional
721	2025-07-15 11:11:11+00	senado	Ramírez Acuña Francisco Javier	PAN	Jalisco
722	2025-07-15 11:11:11+00	senado	Ramírez Marín Jorge Carlos	PVEM	Yucatán
723	2025-07-15 11:11:11+00	senado	Ramírez Padilla Julieta Andrea	Morena	Baja California
724	2025-07-15 11:11:11+00	senado	Reyes Carmona Emmanuel	Morena	Representación Proporcional
725	2025-07-15 11:11:11+00	senado	Reyes Hernández Ivideliza	PAN	Nayarit
726	2025-07-15 11:11:11+00	senado	Riquelme Solís Miguel Ángel	PRI	Coahuila
727	2025-07-15 11:11:11+00	senado	Rivera Rivera Ana Lilia	Morena	Tlaxcala
728	2025-07-15 11:11:11+00	senado	Robles Gutiérrez Beatriz Silvia	Morena	Querétaro
729	2025-07-15 11:11:11+00	senado	Rodríguez Hernández Verónica	PAN	San Luis Potosí
730	2025-07-15 11:11:11+00	senado	Romero Celis Mely	PRI	Colima
731	2025-07-15 11:11:11+00	senado	Ruiz Ruiz Karina Isabel	Morena	Representación Proporcional
732	2025-07-15 11:11:11+00	senado	Ruíz Sandoval Cristina	PRI	Representación Proporcional
733	2025-07-15 11:11:11+00	senado	Ruvalcaba Gámez Nora	Morena	Aguascalientes
734	2025-07-15 11:11:11+00	senado	Salazar Fernández Luis Fernando	Morena	Coahuila
735	2025-07-15 11:11:11+00	senado	Salgado Macedonio José Félix	Morena	Guerrero
736	2025-07-15 11:11:11+00	senado	Sánchez García Lizeth	PT	Puebla
737	2025-07-15 11:11:11+00	senado	Sánchez Ramos Paloma	PRI	Sinaloa
738	2025-07-15 11:11:11+00	senado	Sánchez Vásquez Gustavo	PAN	Baja California
739	2025-07-15 11:11:11+00	senado	Sanmiguel Sánchez Imelda Margarita	PAN	Tamaulipas
740	2025-07-15 11:11:11+00	senado	Saucedo Reyes Araceli	Morena	Michoacán
741	2025-07-15 11:11:11+00	senado	Segura Vázquez Eugenio	Morena	Quintana Roo
742	2025-07-15 11:11:11+00	senado	Sheffield Padilla Francisco Ricardo	Morena	Guanajuato
743	2025-07-15 11:11:11+00	senado	Silva Romo Luis Alfonso	PVEM	Representación Proporcional
744	2025-07-15 11:11:11+00	senado	Sosa Ruíz Olga Patricia	Morena	Tamaulipas
745	2025-07-15 11:11:11+00	senado	Téllez García María Lilly del Carmen	PAN	Representación Proporcional
746	2025-07-15 11:11:11+00	senado	Toledo Zamora Karla Guadalupe	PRI	Representación Proporcional
747	2025-07-15 11:11:11+00	senado	Trasviña Waldenrath Jesús Lucía	Morena	Baja California Sur
748	2025-07-15 11:11:11+00	senado	Valdez Martínez Lilia Margarita	Morena	Durango
749	2025-07-15 11:11:11+00	senado	Valles Sampedro Lorenia Iveth	Morena	Sonora
750	2025-07-15 11:11:11+00	senado	Vargas del Villar Enrique	PAN	México
751	2025-07-15 11:11:11+00	senado	Vázquez Robles Mario Humberto	PAN	Chihuahua
752	2025-07-15 11:11:11+00	senado	Velasco Coello Manuel	PVEM	Representación Proporcional
753	2025-07-15 11:11:11+00	senado	Viggiano Austria Alma Carolina	PRI	Hidalgo
754	2025-07-15 11:11:11+00	senado	Vila Dosal Mauricio	PAN	Representación Proporcional
755	2025-07-15 11:11:11+00	senado	Yunes Márquez Miguel Ángel	Morena	Veracruz
756	2025-07-15 11:11:11+00	senado	Zapata Bello Rolando Rodrigo	PRI	Yucatán
757	2025-07-15 11:11:11+00	senado	Zataraín García Susana del Carmen	PAN	Baja California Sur
\.


--
-- Data for Name: logs_de_bots; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.logs_de_bots (id_log_bot, created_at, bot_ejecutado, duracion_ejecucion, ejecutado_por, status_ejecucion) FROM stdin;
\.


--
-- Data for Name: scrape_busquedas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.scrape_busquedas (id_scrape_busqueda, created_at, busqueda, descripcion, cuentas_relacionadas, tiempo, status_busqueda) FROM stdin;
1	2025-07-03 04:15:50.767169+00	"agua" "Estado de México" since:2023-01-01 until:2025-12-31 lang:es	\N	\N	\N	t
\.


--
-- Data for Name: scrape_tw_cuentas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.scrape_tw_cuentas (id_scrape, created_at, handle, nombre, red, status_user, id_scrape_busqueda) FROM stdin;
1	2025-07-03 04:13:53.262127+00	Edomex	Estado de México	x.com	t	1
2	2025-07-03 04:14:09.791909+00	delfinagomeza	\N	\N	t	1
3	2025-07-03 04:14:21.819491+00	horacioduarteo	\N	\N	t	1
4	2025-07-03 04:14:32.34638+00	conagua_mx	\N	\N	t	1
5	2025-07-03 04:14:42.668248+00	Caem_Edomex	\N	\N	t	1
6	2025-07-03 04:14:51.441214+00	AguaParaTodosMX	\N	\N	t	1
7	2025-07-03 04:15:06.442443+00	GreenpeaceMX	\N	\N	t	1
\.


--
-- Data for Name: senado; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.senado (id_senado_doc, created_at, sinopsis, iniciativa_texto, iniciativa_id, gaceta, link_iniciativa, fuente, imagen_link, temas, personas, partidos, leyes, resumen, analisis, objeto, correspondiente, tipo, analizado, "Proponente", transitorios, link_documento, titulo, keywords, subtema, dependencia, ultimo_doc_expediente, ver_expediente) FROM stdin;
3566	2025-07-30 01:19:05.525891+00	Exhorta a la Secretaría de Salud y a la Comisión Federal para la Protección Contra Riesgos Sanitarios a intensificar campañas de difusión y crear programas que contribuyan a no consumir cigarrillos electrónicos y vapeadores.	De la Dip. Diana Estefanía Gutiérrez Valtierra, del Grupo Parlamentario del Partido Acción Nacional, con punto de acuerdo que exhorta a la Secretaría de Salud y a la Comisión Federal para la Protección Contra Riesgos Sanitarios a intensificar campañas de difusión, y crear programas que contribuyan a no consumir cigarrillos electrónicos y vapeadores, en cumplimiento de la reforma constitucional en la materia y en protección de la salud pública.	 https://www.senado.gob.mx/66/gaceta_comision_permanente/documento/150651	 150651	 https://www.senado.gob.mx/66/gaceta_comision_permanente/documento/150651	Cámara de Senadores	\N	Salud Pública - Prevención de Adicciones	Diana Estefanía Gutiérrez Valtierra	Partido Acción Nacional	artículos 4° y 5° de la Constitución Política de los Estados Unidos Mexicanos, decreto del 17 de enero de 2025	La diputada Diana Estefanía Gutiérrez propone exhortar a las autoridades de salud a intensificar campañas contra el consumo de cigarrillos electrónicos y vapeadores, respaldando la reciente reforma que prohibió su producción y comercialización.	Esta propuesta presenta un enfoque crucial para abordar un problema de salud pública creciente en México, especialmente entre los jóvenes. Las campañas de difusión son esenciales no solo para prevenir el consumo de sustancias nocivas, sino también para mitigar el riesgo de que las nuevas generaciones sean adictas a la nicotina. La existencia de una reforma constitucional que prohíbe estos dispositivos es significativa, pero su éxito depende de la voluntad y la efectividad de las campañas de concientización y vigilancia por parte de la Secretaría de Salud y COFEPRIS. Este punto de acuerdo tiene el potencial de impactar positivamente en la salud pública al reducir el acceso y el uso de productos dañinos. Para las empresas, esto podría significar un ajuste en la estrategia de mercado para aquellos que comercializan productos alternativos al tabaco. Inversionistas y ciudadanos también se verán afectados: mientras que la iniciativa podría percibirse como restrictiva, también puede abrir oportunidades para el desarrollo de productos de salud alternativos y campañas de salud pública. Sin embargo, la implementación efectiva puede enfrentar resistencias tanto sociales como de la industria que intenta apoyar el consumo de estos productos. La dimensión política es relevante, ya que la posición del partido en el poder puede reflejar un compromiso claro con la salud pública, contrastando con otras posturas más laxas; además, se espera una alineación con movimientos sociales que apoyan la reducción del uso de tabaco y sus derivados. El éxito dependerá de la capacidad de las autoridades para educar y generar conciencia sobre los riesgos del vapeo y la importancia de la reforma vigente.	Proposición con punto de acuerdo que exhorta a intensificar esfuerzos para prevenir el consumo de dispositivos de vapeo en el país.	Exhorta a la Secretaría de Salud y a la Comisión Federal para la Protección Contra Riesgos Sanitarios a intensificar campañas de difusión y crear programas que contribuyan a no consumir cigarrillos electrónicos y vapeadores.	PUNTO DE ACUERDO	t	Diana Estefanía Gutiérrez Valtierra	Las campañas deben ser implementadas en un plazo no mayor a 365 días a partir de la publicación de la reforma, estableciendo mecanismos claros de vigilancia y concientización.	https://infosen.senado.gob.mx/sgsp/gaceta/66/1/2025-06-25-1/assets/documentos/PA_PAN_Dip_Estefanía_salúd_pública.pdf	EXHORTO A INTENSIFICAR CAMPAÑAS CONTRA EL VAPEO	salud, vapeo, cigarrillos electrónicos, PROTECCIÓN salud pública, reformas, prevención, campañas difusión, COFEPRIS, Diana Estefanía Gutiérrez Valtierra,Partido Acción Nacional,Diana Estefanía Gutiérrez Valtierra,LXVI/1SPR-19/150651,Salud Pública - Prevención de Adicciones,,artículos 4° y 5° de la Constitución Política de los Estados Unidos Mexicanos, decreto del 17 de enero de 2025,salud pública, regulación del uso de sustancias, prevención de adicciones	\N	\N	\N	\N
3560	2025-07-30 01:00:45.359103+00	Modifica y adiciona artículos de la Ley General de Alimentación Adecuada y Sostenible, priorizando la inclusión de comedores y cocinas comunitarias para garantizar una alimentación nutritiva a las comunidades vulnerables.	Que reforma y adiciona diversas disposiciones de la Ley General de la Alimentación Adecuada y Sostenible, en materia de alimentación adecuada y suficiente en comedores y cocinas comunitarias de comunidades y pueblos indígenas y afromexicanos, a cargo de la diputada María de Fátima García León, del Grupo Parlamentario de Movimiento Ciudadano.\n\nLa que suscribe, diputada federal María de Fátima García León, integrante del Grupo Parlamentario de Movimiento Ciudadano de la LXVI Legislatura del Congreso de la Unión, con fundamento en lo dispuesto en el artículo 71, fracción II, de la Constitución Política de los Estados Unidos Mexicanos, así como los artículos 6, numeral 1, 77 y 78 del Reglamento de la Cámara de Diputados, somete a consideración de esta honorable soberanía iniciativa con proyecto de decreto conforme a la siguiente: Exposición de Motivos...\n\n[Texto completo de la iniciativa]	https://gaceta.diputados.gob.mx/Gaceta/66/2025/mar/20250325-II-6.html	Anexo II-6	https://gaceta.diputados.gob.mx/Gaceta/66/2025/mar/20250325-II-6.html#Iniciativa2	Cámara de Diputados	\N	Alimentación - Inseguridad Alimentaria, Derechos Humanos	María de Fátima García León	Movimiento Ciudadanosdffds	Ley General de Alimentación Adecuada y Sostenible	Propuesta de reforma a la Ley General de Alimentación Adecuada y Sostenible para garantizar el acceso a alimentación suficiente en comedores y cocinas comunitarias de comunidades indígenas y afromexicanas.sdf	El análisis de esta iniciativa debe ser crítico, considerando que su impacto en el ámbito social y económico es significativo. Se prevé que la implementación de comedores y cocinas comunitarias pueda mejorar la seguridad alimensdftaria en comunidades indígenas y afromexicanas, que históricamente han sido marginadas. Las empresas que operan en la producción y distribución de alimentos tendrán que adaptarse a una normativa que prioriza el uso de recursos locales, lo cual abre la posibilidad para emprendimientos regionales, pero también podría confrontar la dinámica de grandes proveedores. En el ámbito social, las tensiones pueden surgir en partidos políticos que ven esta iniciativa como un intento de fortalecer la base de apoyo en un electorado vulnerable. Legalmente, se requiere que los gobiernos estatales y municipales armonicen sus leyes de acuerdo con esta reforma, lo que puede ser una carga administrativa significativa. Asimismo, es vital que la iniciativa contemple formación y capacitación de los grupos beneficiarios para asegurar una implementación efectiva. La cuestión de sostenibilidad en la producción alimentaria será clave, demandando una estrategia a largo plazo que fomente la autosuficiencia y la integración de prácticas agrícolas sostenibles. Este enfoque podría no solo reducir la malnutrición, sino fomentar la salud pública en general.. \nTransitorios:El presente Decreto entrará en vigor el día siguiente a su publicación. Los Congresos de las Entidades Federativas tendrán un plazo de noventa días para armonizar su marco jurídico. Se deberá emitir el Reglamento correspondiente en un plazo de ciento ochenta días.	Modifica y adiciona artículos de la Ley General de Alimentación Adecuada y Sostenible, priorizando la inclusión de comedores y cocinas comunitarias para garantizar una alimentación nutritiva a las comunidades vulnerables.	Secretaría de Agricultura y Desarrollo Rural, Secretaría de Bienestar	INICIATIVA	t	María de Fátima García León (Movimiento Ciudadano)	El presente Decreto entrará en vigor el día siguiente a su publicación. Los Congresos de las Entidades Federativas tendrán un plazo de noventa días para armonizar su marco jurídico. Se deberá emitir el Reglamento correspondiente en un plazo de ciento ochenta días.	https://dbd.gepdigital.ai/html2pdf/reforma_ley_alimentacion_maria_de_fatima_garcia_leon_2025_movimiento_ciudadano_iniciativa_original.pdf	REFORMA DE LA LEY GENERAL DE ALIMENTACIÓN ADECUADA Y SOSTENIBLE PARA COMEDORES Y COCINAS COMUNITARIAS INDÍGENAS Y AFROMEXICANAS	alimentación, comunidades indígenas, cocinas comunitarias, salud, nutrición	\N	\N	\N	\N
3578	2025-07-30 02:03:46.090584+00	\N	SSA-Secretaría de Salud.	https://www.cofemersimir.gob.mx/portales/resumen/58563	NA	https://www.cofemersimir.gob.mx/portales/resumen/58563	CONAMER	\N	IMPACTO ECONÓMICO, SALUD PÚBLICA	\N	\N	\N	La simplificación de trámites ante COFEPRIS busca reducir la burocracia en el sector salud, promoviendo inversión y acceso más rápido a medicinas, mientras plantea desafíos de implementación para el gobierno..\n	La iniciativa de simplificación para trámites ante la Comisión Federal para la Protección contra Riesgos Sanitarios (COFEPRIS) promete un impacto multidimensional en México. Para las empresas, nacionales y extranjeras, esta medida podría reducir costos operativos y acelerar el tiempo de entrada al mercado de productos sanitarios, lo que fomentaría la inversión en el sector. Las iniciativas privadas y emprendimientos encontrarían mayores oportunidades para innovar sin las cargas burocráticas anteriores. Los inversionistas, tanto nacionales como internacionales, podrían ver esta simplificación como una señal positiva del gobierno, mejorando la percepción del clima de negocios en México. Para la ciudadanía, este acuerdo puede traducirse en un acceso más rápido a medicamentos y tratamientos, especialmente en sectores vulnerables o regiones alejadas. Los funcionarios públicos podrían enfrentar desafíos en la implementación de estos cambios, requiriendo capacitación adicional y posibles restructuraciones. En cuanto a los partidos políticos, aquellos que apoyan la desregulación pueden alinearse con esta iniciativa, mientras que otros podrían cuestionar el balance entre seguridad y eficiencia en el control sanitario. Además, significa un reto para medios, sociedad civil y sindicatos que vigilan la eficiencia y seguridad del sistema de salud. En conjunto, esta simplificación podría fortalecer la posición de México en el contexto internacional como un país abierto a la inversión y comprometido con la eficiencia sin perder el enfoque en la seguridad pública..\n\nÚltimo Documento del Expediente:\nExpediente:30560\nTipo de Documento: Aceptar exención MIR \nFecha de Emisión:26/03/2025\nRemitente:Bernardo De Luna Ruíz\nReferencia: CONAMER/25/1092 \nhttps://www.cofemersimir.gob.mx/expedientes/30560	\N	\N	NOTA	t	\N		https://www.cofemersimir.gob.mx/expediente/30560/mir/58563/regulacion/7891976	ACUERDO POR EL QUE SE ESTABLECEN ACCIONES DE SIMPLIFICACIÓN PARA TRÁMITES QUE SE REALIZAN ANTE LA COMISIÓN FEDERAL PARA LA PROTECCIÓN CONTRA RIESGOS SANITARIOS.	COFEPRIS, simplificación, trámites sanitarios, inversión, sector salud, burocracia, México	\N	\N	\N	\N
3564	2025-07-30 01:13:28.091201+00	Modifica la Ley Nacional de Ejecución Penal para asegurar el derecho a condiciones de higiene menstrual en los centros penitenciarios, dotando a las mujeres encarceladas de productos específicos y atención médica adecuada.	Se busca que las mujeres privadas de libertad tengan acceso a productos menstruales, instalaciones adecuadas y atención ginecológica en los centros penitenciarios, reconociendo su derecho a gestionar su menstruación dignamente.	https://www.senado.gob.mx/66/gaceta_comision_permanente/documento/150771	150771	https://www.senado.gob.mx/66/gaceta_comision_permanente/documento/150771	Cámara de Senadores	\N	Derechos Humanos - Menstruación Digna	María del Rocío Corona Nakamura	Partido Verde Ecologista de México	Ley Nacional de Ejecución Penal	Propone garantizar el derecho a una gestión menstrual digna de las mujeres privadas de la libertad, estableciendo la obligación del Estado de proveer productos menstruales gratuitos y adecuados.	La iniciativa presenta implicaciones críticas para diversos sectores. Para las empresas, representa oportunidades en la fabricación y suministro de productos menstruales. Inversores pueden ver un cambio favorable en el tratamiento de los derechos humanos, mientras que la ciudadanía, especialmente mujeres en situación vulnerada, se beneficiará directamente, mejorando su calidad de vida. Por otro lado, funcionarios públicos enfrentarán el reto de implementar políticas adecuadas en la atención de estos derechos, los partidos políticos tendrán que posicionarse en torno a la equidad de género, y otros actores como los sindicatos y la sociedad civil serán fundamentales para la vigilancia del cumplimiento de la ley. No obstante, se enfrentan tensiones entre nuevas políticas y la resistencia cultural hacia el tema de la menstruación en las cárceles, que puede generar oposiciones significativas..\nTransitorios: El decreto entrará en vigor a los siguientes días de su publicación en el Diario Oficial de la Federación. Las instituciones deberán hacer ajustes presupuestales para cumplir con las nuevas obligaciones establecidas.. Leyes impactadas:Ley Nacional de Ejecución Penal	Modifica la Ley Nacional de Ejecución Penal para asegurar el derecho a condiciones de higiene menstrual en los centros penitenciarios, dotando a las mujeres encarceladas de productos específicos y atención médica adecuada.	Secretaría de Gobierno, Sistema Penitenciario	INICIATIVA	t	Corona Nakamura María del Rocío (PVEM - Jalisco)	El decreto entrará en vigor a los siguientes días de su publicación en el Diario Oficial de la Federación. Las instituciones deberán hacer ajustes presupuestales para cumplir con las nuevas obligaciones establecidas.	https://infosen.senado.gob.mx/sgsp/gaceta/66/1/2025-06-25-1/assets/documentos/Ini_PVEM_Sen_Roc%C3%ADo_Nakamura_mestruaci%C3%B3n_digna_LNEP.pdf	DE LA SEN. MARÍA DEL ROCÍO CORONA NAKAMURA, DEL GRUPO PARLAMENTARIO DEL PARTIDO VERDE ECOLOGISTA DE MÉXICO, CON PROYECTO DE DECRETO POR EL QUE SE REFORMAN Y ADICIONAN DIVERSAS DISPOSICIONES DE LA LEY NACIONAL DE EJECUCIÓN PENAL.	menstruación, derechos humanos, salud, mujeres, justicia, centros penitenciarios,,Ley Nacional de Ejecución Penal,Secretaría de Gobierno, Sistema Penitenciario,Partido Verde Ecologista de México,Corona Nakamura María del Rocío (PVEM - Jalisco),Derechos Humanos - Menstruación Digna	\N	\N	\N	\N
3575	2025-07-30 01:53:32.63446+00	\N	El presente convenio establece la colaboración entre la Secretaría de Medio Ambiente y Recursos Naturales, a través de la Comisión Nacional del Agua, y el Estado de Colima, con el fin de llevar a cabo el proyecto Agua para Colima. Este proyecto tiene como objetivo garantizar el abastecimiento de agua potable para los municipios de Colima y Villa de Álvarez, lo que responde a la creciente necesidad de acceso a agua potable en la región. La firma del convenio se realiza en un contexto legal y social que busca cumplir con el derecho al agua de todos los ciudadanos, asegurando una gestión sustentable de este recurso vital.	https://www.dof.gob.mx/nota_detalle.php?codigo=5764001	\N	https://www.dof.gob.mx/nota_detalle.php?codigo=5764001	Diario Oficial de la Federación	\N	Agua - Gestión Sustentable	(Efraín Morales López, CONAGUA), (Felipe Zataráin Mendoza, CONAGUA), (Indira Vizcaíno Silva, Estado), (Alberto Eloy García Alcaraz, Estado), (Fabiola Verduzco Aparicio, Estado), (Marisol Neri León, Estado)	NA	Constitución Política de los Estados Unidos Mexicanos, Ley de Planeación, Ley de Aguas Nacionales	El presente convenio establece la colaboración entre la Secretaría de Medio Ambiente y Recursos Naturales, a través de la Comisión Nacional del Agua, y el Estado de Colima, con el fin de llevar a cabo el proyecto Agua para Colima. Este proyecto tiene como objetivo garantizar el abastecimiento de agua potable para los municipios de Colima y Villa de Álvarez, lo que responde a la creciente necesidad de acceso a agua potable en la región. La firma del convenio se realiza en un contexto legal y social que busca cumplir con el derecho al agua de todos los ciudadanos, asegurando una gestión sustentable de este recurso vital.	La iniciativa del Proyecto Agua para Colima representa una acción crítica para el manejo del agua en la región, atendiendo la alta presión hídrica y los desafíos del crecimiento poblacional. Para las empresas, esto puede significar una inversión significativa en infraestructura, presentando tanto oportunidades como riesgos ante la dependencia de recursos hídricos. Los inversionistas podrían ver en este proyecto una oportunidad de estabilidad a largo plazo, aunque deben considerar las tensiones políticas y legales que puedan surgir. Para los ciudadanos, principalmente aquellos en áreas vulnerables, el acceso a agua potable se categoriza como un derecho humano esencial, evidenciando la necesidad de acciones que prevengan conflictos sociales. La postura de los partidos políticos y la sociedad civil será crucial en el monitoreo y ejecución de las políticas públicas relacionadas con el agua, ya que esto incidirá en el equilibrio entre intereses económicos y el bienestar social.	NA	NA	INICIATIVA	t	\N	NA	http://scrape.gepdigital.ai/archivos/2025_07_29_MAT_semarnat_1_C.pdf	CONVENIO DE COORDINACIÓN QUE CELEBRAN LA SECRETARÍA DE MEDIO AMBIENTE Y RECURSOS NATURALES, A TRAVÉS DE LA COMISIÓN NACIONAL DEL AGUA, Y EL ESTADO DE COLIMA, CON EL OBJETO DE CONJUNTAR RECURSOS Y ACCIONES PARA LA EJECUCIÓN DEL PROYECTO AGUA PARA COLIMA, PARA EL ABASTECIMIENTO DE AGUA POTABLE PARA LA ZONA CONURBADA DE LOS MUNICIPIOS DE COLIMA Y VILLA DE ÁLVAREZ.	convenio, agua, Colima, abastecimiento, CONAGUA	\N	\N	\N	\N
\.


--
-- Data for Name: subtemas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.subtemas (id_subtema, created_at, id_tema, subtema_text, subtema_desc) FROM stdin;
325	2025-08-06 17:00:37.494456+00	53	Ciberseguridad	Prácticas, normas y tecnologías destinadas a proteger sistemas digitales, redes y datos frente a accesos no autorizados, ataques o daños cibernéticos.
326	2025-08-06 17:00:37.494456+00	53	General	Contenidos o documentos relacionados con la Agenda Digital que abordan temas de forma transversal o introductoria, sin enfocarse en un subtema específico.
327	2025-08-06 17:00:37.494456+00	53	Impuestos digitales	Normativas y propuestas fiscales enfocadas en la tributación de empresas tecnológicas, servicios digitales y comercio electrónico a nivel nacional o internacional.
328	2025-08-06 17:00:37.494456+00	53	Inteligencia Artificial	Desarrollo y aplicación de sistemas capaces de realizar tareas que requieren inteligencia humana, como el aprendizaje automático, el reconocimiento de patrones y la toma de decisiones automatizada.
329	2025-08-06 17:00:37.494456+00	53	Internet	Aspectos técnicos, regulatorios y sociales relacionados con el acceso, gobernanza, neutralidad, infraestructura y evolución del ecosistema de Internet.
330	2025-08-06 17:00:37.494456+00	53	Monedas y activos digitales	Uso y regulación de criptomonedas, monedas digitales emitidas por bancos centrales (CBDCs), tokens y otros activos digitales basados en blockchain.
331	2025-08-06 17:00:37.494456+00	53	Plataformas digitales	Empresas o servicios que operan en entornos digitales facilitando la interacción entre usuarios y proveedores de bienes o servicios, como marketplaces, apps de movilidad, streaming, entre otros.
332	2025-08-06 17:00:37.494456+00	53	Redes sociales	Medios digitales que permiten la creación, intercambio y difusión de contenidos entre usuarios, así como las implicaciones sociales, políticas y económicas de su uso.
333	2025-08-06 17:00:37.494456+00	53	Tecnologías de la información	Infraestructura, hardware, software y servicios relacionados con el procesamiento, almacenamiento y transmisión de datos e información digital.
334	2025-08-06 17:00:37.494456+00	53	Delitos Digitales	Actividades ilícitas cometidas a través de medios digitales, como fraudes electrónicos, robo de identidad, acceso indebido a sistemas o distribución de contenido ilegal.
335	2025-08-06 17:25:03.375313+00	54	Comisiones Bancarias	Cargos que las instituciones financieras aplican por la prestación de servicios como manejo de cuentas, transferencias, retiros, entre otros.
336	2025-08-06 17:25:03.375313+00	54	Crédito	Otorgamiento de recursos financieros por parte de entidades públicas o privadas a personas o empresas bajo condiciones de pago y tasa de interés.
337	2025-08-06 17:25:03.375313+00	54	Criptoactivos / Criptomonedas	Activos digitales que utilizan tecnología blockchain para garantizar su seguridad y funcionamiento, incluyendo monedas virtuales como Bitcoin o Ethereum y otros tokens digitales.
338	2025-08-06 17:25:03.375313+00	54	Educación Financiera	Acciones y contenidos que promueven el conocimiento y habilidades para tomar decisiones informadas sobre el manejo del dinero, ahorro, inversión y endeudamiento.
339	2025-08-06 17:25:03.375313+00	54	Hipotecario	Créditos garantizados con bienes inmuebles, comúnmente utilizados para la adquisición de vivienda, así como sus condiciones, regulación y mercado asociado.
340	2025-08-06 17:25:03.375313+00	54	Instituciones de crédito	Entidades autorizadas para captar recursos del público y otorgar créditos, como bancos, sociedades financieras de objeto múltiple (SOFOMES), entre otros.
341	2025-08-06 17:25:03.375313+00	54	Lavado de dinero	Proceso mediante el cual se encubren fondos obtenidos a través de actividades ilícitas para que aparenten tener un origen legal, incluyendo mecanismos de detección y regulación.
342	2025-08-06 17:25:03.375313+00	54	Pagos electrónicos	Medios y plataformas digitales que permiten realizar transacciones financieras sin necesidad de efectivo, como transferencias, billeteras digitales, CoDi, entre otros.
343	2025-08-06 17:25:03.375313+00	54	Protección de Datos Personales	Normativas y prácticas orientadas a garantizar la seguridad y privacidad de la información financiera y personal de los usuarios dentro del sistema financiero.
344	2025-08-06 17:25:03.375313+00	54	Secreto Bancario	Principio que protege la confidencialidad de la información financiera de los clientes frente a terceros, con excepciones previstas por la ley.
345	2025-08-06 17:25:03.375313+00	54	Servicios Financieros	Conjunto de productos ofrecidos por instituciones financieras, incluyendo cuentas de ahorro, seguros, inversiones, préstamos y asesoría financiera.
346	2025-08-06 17:25:03.375313+00	54	Tarjetas de crédito	Instrumentos financieros que permiten a los usuarios disponer de una línea de crédito para realizar compras o retiros, bajo condiciones de pago y tasas de interés.
347	2025-08-06 17:25:03.375313+00	54	Tasas de interés	Porcentaje que se cobra o se paga por el uso de dinero en operaciones de crédito o inversión, determinado por condiciones del mercado y políticas monetarias.
348	2025-08-06 17:25:03.375313+00	54	Tecnología financiera	Innovaciones tecnológicas aplicadas a los servicios financieros (Fintech), que mejoran la eficiencia, inclusión y accesibilidad de estos servicios.
349	2025-08-06 17:25:03.375313+00	54	Títulos de crédito	Documentos que representan una obligación de pago, como cheques, pagarés, letras de cambio, y que facilitan las transacciones económicas.
350	2025-08-06 17:25:03.375313+00	54	Transparencia	Acceso claro y oportuno a la información financiera, contractual y de costos para los usuarios, promoviendo la confianza y el cumplimiento normativo en el sector financiero.
351	2025-08-11 16:34:43.837157+00	55	Educación básica	Etapa obligatoria que abarca preescolar, primaria y secundaria, enfocada en dotar de competencias fundamentales en lectura, escritura, matemáticas y valores cívicos.
352	2025-08-11 16:34:43.837157+00	55	Educación media superior	Nivel que incluye preparatorias, bachilleratos y educación técnica, clave para el desarrollo de competencias previas a la educación superior o al mercado laboral.
353	2025-08-11 16:34:43.837157+00	55	Educación superior	Universidades, institutos y tecnológicos que ofrecen licenciaturas, posgrados y especializaciones, fundamentales para la innovación y competitividad del país.
354	2025-08-11 16:34:43.837157+00	55	Formación docente	Capacitación y actualización profesional de maestros para mejorar la calidad educativa, especialmente ante cambios tecnológicos y pedagógicos.
355	2025-08-11 16:34:43.837157+00	55	Brecha digital educativa	Desigualdad en el acceso a internet, dispositivos y competencias digitales que limita las oportunidades de aprendizaje, sobre todo en zonas rurales.
356	2025-08-13 00:11:31.40941+00	56	fuetnes	fuetnes a gua
\.


--
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.temas (id_tema, created_at, nombre_tema, desc_tema, activo) FROM stdin;
54	2025-08-06 17:25:03.249506+00	Financiero	Conjunto de actividades, regulaciones y servicios relacionados con la administración del dinero, el crédito, la inversión, los sistemas bancarios y las tecnologías aplicadas al sector financiero.	f
53	2025-08-06 16:53:08.270634+00	Agenda Digital	Conjunto de políticas, estrategias y acciones enfocadas en el desarrollo, regulación y aprovechamiento de las tecnologías digitales para impulsar la innovación, el crecimiento económico, la inclusión y la transformación social.	t
55	2025-08-11 16:34:43.678272+00	Educacion	La educación es el proceso formativo que busca desarrollar conocimientos, habilidades y valores en la población, desde la primera infancia hasta la educación superior y la formación continua. Actualmente, enfrenta retos como la desigualdad de acceso, la calidad docente, la infraestructura, la digitalización y la vinculación con el mercado laboral.	t
56	2025-08-13 00:11:31.32154+00	Agua	la cosa que se toma	t
\.


--
-- Data for Name: unidades_empresas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.unidades_empresas (id_unidad, created_at, nombre_unidad_interna, id_usuario) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.usuarios (id, created_at, user_id, nombre, apellido, email, perfil, activo, password_hash) FROM stdin;
1	2025-06-07 18:14:31.143835+00	3de786b3-753d-4aa5-a52d-9ca91808c08b	admin	istrador	admin@gep.com.mx	Administrador	t	\N
6	2025-06-10 20:36:09.531284+00	c4a994d9-8d35-483b-a60e-a0eb0a10db6b	joel	araujo	joeldavidar@gep.com.mx	Analista GEP	t	\N
9	2025-07-23 23:35:27.745049+00	7b8b124e-b43a-4680-920e-a42047702501	Victor	Cauch	victorc@gep.com.mx	Analista GEP	t	\N
10	2025-07-25 17:18:25.617877+00	329ac582-cb03-43b1-b1be-e01f5c187ca2	Adelaida	Conde	aconde@gep.com.mx	Administrador	t	\N
8	2025-07-23 19:43:38.077102+00	305bfa9c-6966-4043-a194-e9d0bf060f28	Citlaly	Morales Magos	cmorales@gep.com.mx	Administrador	t	\N
11	2025-07-29 22:22:29.032773+00	445c9d84-7932-470c-9d76-d3f280c4b9a6	QA	Tester	qa@gep.com.mx	Analista GEP	t	\N
12	2025-08-11 15:55:47.372745+00	a2d0ae5a-e3c1-4c1c-8109-16916fbb75d1	Citlaly	Morales QA	citlalyqa@gep.com.mx	Administrador	t	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-05-21 05:29:39
20211116045059	2025-05-21 05:29:39
20211116050929	2025-05-21 05:29:39
20211116051442	2025-05-21 05:29:39
20211116212300	2025-05-21 05:29:39
20211116213355	2025-05-21 05:29:39
20211116213934	2025-05-21 05:29:39
20211116214523	2025-05-21 05:29:39
20211122062447	2025-05-21 05:29:39
20211124070109	2025-05-21 05:29:39
20211202204204	2025-05-21 05:29:39
20211202204605	2025-05-21 05:29:39
20211210212804	2025-05-21 05:29:39
20211228014915	2025-05-21 05:29:39
20220107221237	2025-05-21 05:29:39
20220228202821	2025-05-21 05:29:39
20220312004840	2025-05-21 05:29:39
20220603231003	2025-05-21 05:29:39
20220603232444	2025-05-21 05:29:39
20220615214548	2025-05-21 05:29:39
20220712093339	2025-05-21 05:29:39
20220908172859	2025-05-21 05:29:39
20220916233421	2025-05-21 05:29:39
20230119133233	2025-05-21 05:29:39
20230128025114	2025-05-21 05:29:39
20230128025212	2025-05-21 05:29:39
20230227211149	2025-05-21 05:29:39
20230228184745	2025-05-21 05:29:39
20230308225145	2025-05-21 05:29:39
20230328144023	2025-05-21 05:29:39
20231018144023	2025-05-21 05:29:39
20231204144023	2025-05-21 05:29:39
20231204144024	2025-05-21 05:29:39
20231204144025	2025-05-21 05:29:39
20240108234812	2025-05-21 05:29:39
20240109165339	2025-05-21 05:29:39
20240227174441	2025-05-21 05:29:39
20240311171622	2025-05-21 05:29:39
20240321100241	2025-05-21 05:29:39
20240401105812	2025-05-21 05:29:39
20240418121054	2025-05-21 05:29:39
20240523004032	2025-05-21 05:29:40
20240618124746	2025-05-21 05:29:40
20240801235015	2025-05-21 05:29:40
20240805133720	2025-05-21 05:29:40
20240827160934	2025-05-21 05:29:40
20240919163303	2025-05-21 05:29:40
20240919163305	2025-05-21 05:29:40
20241019105805	2025-05-21 05:29:40
20241030150047	2025-05-21 05:29:40
20241108114728	2025-05-21 05:29:40
20241121104152	2025-05-21 05:29:40
20241130184212	2025-05-21 05:29:40
20241220035512	2025-05-21 05:29:40
20241220123912	2025-05-21 05:29:40
20241224161212	2025-05-21 05:29:40
20250107150512	2025-05-21 05:29:40
20250110162412	2025-05-21 05:29:40
20250123174212	2025-05-21 05:29:40
20250128220012	2025-05-21 05:29:40
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
documentos	documentos	\N	2025-06-06 00:41:43.270436+00	2025-06-06 00:41:43.270436+00	t	f	\N	\N	\N
logo	logo	\N	2025-07-17 20:40:18.178648+00	2025-07-17 20:40:18.178648+00	t	f	\N	\N	\N
pdfs	pdfs	\N	2025-07-18 21:07:24.123704+00	2025-07-18 21:07:24.123704+00	t	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-05-21 05:29:24.822754
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-05-21 05:29:24.835274
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-05-21 05:29:24.843702
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-05-21 05:29:24.867193
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-05-21 05:29:24.951051
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-05-21 05:29:24.974698
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-05-21 05:29:25.02504
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-05-21 05:29:25.03151
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-05-21 05:29:25.035724
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-05-21 05:29:25.042796
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-05-21 05:29:25.045736
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-05-21 05:29:25.053953
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-05-21 05:29:25.064293
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-05-21 05:29:25.069283
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-05-21 05:29:25.07926
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-05-21 05:29:25.170793
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-05-21 05:29:25.218255
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-05-21 05:29:25.22682
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-05-21 05:29:25.234549
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-05-21 05:29:25.243814
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-05-21 05:29:25.250783
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-05-21 05:29:25.262495
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-05-21 05:29:25.334404
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-05-21 05:29:25.417625
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-05-21 05:29:25.434141
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-05-21 05:29:25.443254
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-05-21 05:29:25.4497
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-05-21 05:29:25.734082
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-05-21 05:29:25.747109
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-05-21 05:29:25.751555
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-05-21 05:29:25.757722
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-05-21 05:29:25.763727
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-05-21 05:29:25.772478
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-05-21 05:29:25.778786
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-05-21 05:29:25.860076
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-05-21 05:29:25.939527
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-05-21 05:29:25.945207
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-05-21 05:29:26.073706
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
a9cfa2ce-a1bc-4342-963f-993609b57f1e	pdfs	Ini_MC_Sen_Amalia_Medina_Ref_Ley_General_de_Salud.pdf	\N	2025-07-23 19:54:04.518789+00	2025-07-23 19:54:04.518789+00	2025-07-23 19:54:04.518789+00	{"eTag": "\\"155b0b757ceca6784ddef42f6b10874c\\"", "size": 293827, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T19:54:04.515Z", "contentLength": 293827, "httpStatusCode": 200}	3a2c94ea-16e4-42d1-b0f1-1ab4d7ed96f6	\N	{}	1
a8db5d64-e3e5-41ae-9cfa-d1a08c7cbf9d	documentos	.emptyFolderPlaceholder	\N	2025-06-06 00:46:50.94718+00	2025-06-06 00:46:50.94718+00	2025-06-06 00:46:50.94718+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-06-06T00:46:50.944Z", "contentLength": 0, "httpStatusCode": 200}	04dd9ed5-1ee0-4571-9b04-ab5615b74964	\N	{}	1
ad06bc4a-6b00-4192-aadf-0bc0ea416c19	logo	1753384217343.jpeg	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-24 19:10:16.04253+00	2025-07-24 19:10:16.04253+00	2025-07-24 19:10:16.04253+00	{"eTag": "\\"8474b0941efa16fe393d9f1b98562ae5\\"", "size": 27400, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-07-24T19:10:16.039Z", "contentLength": 27400, "httpStatusCode": 200}	b459f47b-f1dd-4aa1-9dae-7a0917ececf5	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
ac164da9-2065-4bfb-a8ef-a7d73961e7b0	pdfs	Ini_MC_Sen_Amalia_Medina_Ref_Ley_Proteccion_Personas_Defensoras_Derechos_Humanos_y_Periodistas.pdf	\N	2025-07-23 19:54:32.675488+00	2025-07-23 19:54:32.675488+00	2025-07-23 19:54:32.675488+00	{"eTag": "\\"f856f37ce88ca71c245817a49e73d583\\"", "size": 145412, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T19:54:32.673Z", "contentLength": 145412, "httpStatusCode": 200}	43907113-db5e-4bdb-8b9b-4a23f3c9cc0d	\N	{}	1
79324985-2702-42a7-ae72-dcd31d74566f	documentos	20250325-II-1-1_pages_2_to_44.pdf	\N	2025-07-30 01:40:58.488872+00	2025-07-30 01:40:58.488872+00	2025-07-30 01:40:58.488872+00	{"eTag": "\\"4553cc682a6ac567040138204670dba6\\"", "size": 8347038, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-30T01:40:58.414Z", "contentLength": 8347038, "httpStatusCode": 200}	f210dd29-8519-4e05-b63f-e394fa7a6bb9	\N	{}	1
fa94c3ed-d050-4d12-be2e-3329434de4f1	pdfs	PA_Morena_Sen_Andrea_Chavez_Violencia_Vicaria.pdf	\N	2025-07-23 23:15:40.109993+00	2025-07-23 23:15:40.109993+00	2025-07-23 23:15:40.109993+00	{"eTag": "\\"fad1899133d445755c5252d8a3e3605a\\"", "size": 1616569, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:15:40.098Z", "contentLength": 1616569, "httpStatusCode": 200}	e95bd68d-c451-4a0e-9780-0ba0db814e35	\N	{}	1
f6ecc8ab-1008-4332-b734-baf09736db4c	documentos	20250325-II-1-1_pages_67_to_92.pdf	\N	2025-07-30 01:40:59.609693+00	2025-07-30 01:40:59.609693+00	2025-07-30 01:40:59.609693+00	{"eTag": "\\"3e189bc00865ce5e6eae11a4ed90389e\\"", "size": 427704, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-30T01:40:59.572Z", "contentLength": 427704, "httpStatusCode": 200}	af65fb63-85ff-415c-86a8-ef3917c2fea5	\N	{}	1
6fecd0c7-1668-4206-917e-13baa8f8ac1d	logo	1752785254630.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-17 20:47:39.489738+00	2025-07-17 20:47:39.489738+00	2025-07-17 20:47:39.489738+00	{"eTag": "\\"3b3beecd7df97ecf7b84bea024bae31e\\"", "size": 1568174, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-17T20:47:39.477Z", "contentLength": 1568174, "httpStatusCode": 200}	de5de2c6-aa92-47b1-b4e4-d7ceff4b091f	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
2aff74a0-e9ef-4137-936e-2c6118f00a78	logo	1752795564668.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-17 23:39:23.089909+00	2025-07-17 23:39:23.089909+00	2025-07-17 23:39:23.089909+00	{"eTag": "\\"3f442ad41c8e71a598705d923c7ab3ab\\"", "size": 456776, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-17T23:39:23.084Z", "contentLength": 456776, "httpStatusCode": 200}	2e18249c-8ab4-4377-942c-cf553eae609c	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
293c9e0c-7b31-49a7-bef6-0d0244e51d4c	logo	1752795971280.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-17 23:46:09.327228+00	2025-07-17 23:46:09.327228+00	2025-07-17 23:46:09.327228+00	{"eTag": "\\"90c8af5f4b3d4e3838d23d442e4cde7f\\"", "size": 18745, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-17T23:46:09.324Z", "contentLength": 18745, "httpStatusCode": 200}	5a1bd132-ae2e-4778-8787-60b698eceb20	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
68404c84-59b7-4117-a40c-7c3dffa18cbb	logo	1752852623998.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-18 15:30:26.449112+00	2025-07-18 15:30:26.449112+00	2025-07-18 15:30:26.449112+00	{"eTag": "\\"43137ac8bc7be4f84d65b301a66d9069\\"", "size": 1685335, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-18T15:30:26.434Z", "contentLength": 1685335, "httpStatusCode": 200}	dd9040a0-9196-400e-98d7-cdd77bd13486	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
b7c65837-ea2c-4903-b89c-a3a030d565d7	logo	1752852708461.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-18 15:31:51.583008+00	2025-07-18 15:31:51.583008+00	2025-07-18 15:31:51.583008+00	{"eTag": "\\"c1f3956d22263ee29098e73162647137\\"", "size": 2859735, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-18T15:31:51.566Z", "contentLength": 2859735, "httpStatusCode": 200}	f2971e9b-4453-40f1-8af2-3013d4ef955d	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
b47d6e8d-0b59-404c-be24-57d57f63d369	logo	1752853359153.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-18 15:42:41.994543+00	2025-07-18 15:42:41.994543+00	2025-07-18 15:42:41.994543+00	{"eTag": "\\"c1f3956d22263ee29098e73162647137\\"", "size": 2859735, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-18T15:42:41.979Z", "contentLength": 2859735, "httpStatusCode": 200}	d7d21f4e-7e80-4c7a-b03a-30b24f2669de	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
937e5b80-9d0a-47ef-8828-f4c302006993	pdfs	.emptyFolderPlaceholder	\N	2025-07-18 21:18:00.470235+00	2025-07-18 21:18:00.470235+00	2025-07-18 21:18:00.470235+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-07-18T21:18:00.461Z", "contentLength": 0, "httpStatusCode": 200}	463705b2-0418-48b1-8816-9271e315b375	\N	{}	1
81309f14-72a2-4280-a0b9-d20782acc2fc	pdfs	Ini_MC_Sens_Vivienda_Digna.pdf	\N	2025-07-23 18:37:45.012087+00	2025-07-23 18:37:45.012087+00	2025-07-23 18:37:45.012087+00	{"eTag": "\\"2a4e7d620c5509ef4a7c4bc0e514148e\\"", "size": 1006823, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T18:37:45.002Z", "contentLength": 1006823, "httpStatusCode": 200}	2befa26a-1ddc-4885-852b-70b88b0c5847	\N	{}	1
90e5ea1a-5034-426a-b462-736969872f5a	pdfs	PA_PT_Dip_Maribel_Ruiz_Exhorta_a_la_SSPC_Actualizado_2406025.pdf	\N	2025-07-23 23:19:40.038937+00	2025-07-23 23:19:40.038937+00	2025-07-23 23:19:40.038937+00	{"eTag": "\\"a349e56ab9e220edbf5cf39289688b34\\"", "size": 1895032, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:19:40.028Z", "contentLength": 1895032, "httpStatusCode": 200}	089322a1-5241-4618-80ec-00de04f6c45c	\N	{}	1
2d8ec30b-36c2-4007-b3fd-cb0b9b2d657a	pdfs	PA_PAN_Sen_Marquez_sector_pecuario.pdf	\N	2025-07-23 18:38:16.799764+00	2025-07-23 18:38:16.799764+00	2025-07-23 18:38:16.799764+00	{"eTag": "\\"76f12513ab5dc209b3069eee194bf909\\"", "size": 1583589, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T18:38:16.784Z", "contentLength": 1583589, "httpStatusCode": 200}	b72cfe1f-c839-43e1-9429-90bb98ed431f	\N	{}	1
b83f1770-a7ba-405c-b000-65158d6ece4d	logo	1753303739921.jpg	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-23 20:49:02.181222+00	2025-07-23 20:49:02.181222+00	2025-07-23 20:49:02.181222+00	{"eTag": "\\"94a8b9a312d49eb5c16f3d95662f7494\\"", "size": 67702, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-07-23T20:49:02.178Z", "contentLength": 67702, "httpStatusCode": 200}	d5666877-5efa-460d-800b-f803dfc5ef28	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
7551cb8a-3c87-44f3-b00c-8cd93e099e32	pdfs	PA_MC_Dip_Maria_Garcia_delitos_sexuales.pdf	\N	2025-07-23 23:20:43.50609+00	2025-07-23 23:20:43.50609+00	2025-07-23 23:20:43.50609+00	{"eTag": "\\"36ff000ee1881a547b20b7ab1b2c5386\\"", "size": 2989772, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:20:43.485Z", "contentLength": 2989772, "httpStatusCode": 200}	c0d38fbb-6809-41d8-b86b-2cc1b9039bff	\N	{}	1
3dbcb548-6194-4e25-be3a-6431be167251	pdfs	PA_PT_Sens_Plan_DN-III_Actualizado_2406025.pdf	\N	2025-07-23 23:22:37.182186+00	2025-07-23 23:22:37.182186+00	2025-07-23 23:22:37.182186+00	{"eTag": "\\"9b1b87f5b160cc136a7100d96a936f00\\"", "size": 1282961, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:22:37.172Z", "contentLength": 1282961, "httpStatusCode": 200}	b144934a-f07b-4a23-8dd0-7966cb63fbfd	\N	{}	1
b7262455-27ac-4b0a-b670-8aa010a62bd6	pdfs	PA_Morena_Sen_Andrea_Chavez_Exhorta_al_Gobierno_de_Chihuahua.pdf	\N	2025-07-23 23:24:14.923194+00	2025-07-23 23:24:14.923194+00	2025-07-23 23:24:14.923194+00	{"eTag": "\\"b5a182e3ca88eb3f0163c03db8d96e4b\\"", "size": 1483984, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:24:14.913Z", "contentLength": 1483984, "httpStatusCode": 200}	d8dc061d-c117-4b7b-b08f-2c8e4e92ee23	\N	{}	1
75845222-407f-4bc4-a932-91ed5f684d00	logo	1753829163400.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-29 22:46:03.062985+00	2025-07-29 22:46:03.062985+00	2025-07-29 22:46:03.062985+00	{"eTag": "\\"78c543d4e3ec979205b4eeed3909524a\\"", "size": 47770, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-29T22:46:03.058Z", "contentLength": 47770, "httpStatusCode": 200}	8df3abb1-1e13-4a39-a115-7021dea35ded	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
70745446-c706-4c8e-af22-713cdf114f5b	logo	1753899405244.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-30 18:16:44.076763+00	2025-07-30 18:16:44.076763+00	2025-07-30 18:16:44.076763+00	{"eTag": "\\"e49444ab4073a6b5896156d37242de05\\"", "size": 15801, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-30T18:16:44.073Z", "contentLength": 15801, "httpStatusCode": 200}	58cb2a66-f52d-40ac-8cd1-403ea8893ca2	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
e50370e4-6fea-4b62-bf16-f36bf043442d	logo	1753296496345.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-23 18:48:15.771587+00	2025-07-23 18:48:15.771587+00	2025-07-23 18:48:15.771587+00	{"eTag": "\\"f5ee112c88978af11fa5c683e2b35c2e\\"", "size": 12786, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-23T18:48:15.769Z", "contentLength": 12786, "httpStatusCode": 200}	1d7c80da-0949-49bd-838e-9ff6ecc3c1ea	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
684d9500-526b-4b80-8551-0188044a8cf5	pdfs	PA_PRI_Dip_Hugo_Arroyo_Exhorta_a_la_Dr_Claudia_Sheinbaum.pdf	\N	2025-07-23 23:20:11.541248+00	2025-07-23 23:20:11.541248+00	2025-07-23 23:20:11.541248+00	{"eTag": "\\"0f33fc4088b29e88548f6607780ee932\\"", "size": 321393, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:20:11.537Z", "contentLength": 321393, "httpStatusCode": 200}	29ca8798-4044-4b26-9072-180e97c7063c	\N	{}	1
14918c43-11f9-4011-8cf6-82d2036a3969	pdfs	PA_Morena_Sen_Andrea_Chavez_IMSS_Bienestar.pdf	\N	2025-07-23 21:26:59.379379+00	2025-07-23 21:26:59.379379+00	2025-07-23 21:26:59.379379+00	{"eTag": "\\"c11a26b995d0155136cddb0af340c62c\\"", "size": 1650070, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T21:26:59.367Z", "contentLength": 1650070, "httpStatusCode": 200}	6bd7fc12-9cc2-4914-a77e-79d453fa2756	\N	{}	1
a96648cd-1419-4687-b147-4ce36ee116aa	pdfs	PA_PT_Sens_Servicio_de_Inmigracion_y_Control_Aduanas_Actualizado_2406025.pdf	\N	2025-07-23 23:09:37.216636+00	2025-07-23 23:09:37.216636+00	2025-07-23 23:09:37.216636+00	{"eTag": "\\"c7208f020e18fa4eef9c00a70c3f4ec9\\"", "size": 1238493, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:09:37.208Z", "contentLength": 1238493, "httpStatusCode": 200}	e20d6041-5149-4b92-a178-0c0f32896afa	\N	{}	1
d7851cae-6d26-434d-89e4-2e0f5c6b7c42	pdfs	PA_Morena_Sen_Andrea_Chavez_Exhorta_a_la_PROFEPA.pdf	\N	2025-07-23 23:21:18.115871+00	2025-07-23 23:21:18.115871+00	2025-07-23 23:21:18.115871+00	{"eTag": "\\"af1259e042395ff4827e349f285956c3\\"", "size": 2109672, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:21:18.098Z", "contentLength": 2109672, "httpStatusCode": 200}	53821141-bb73-47b6-84f7-2b2f3819795c	\N	{}	1
dae0de18-e95c-4a94-bab4-42801a56bee0	pdfs	PA_PAN_Sen_Marquez_sector_agropecuario.pdf	\N	2025-07-23 23:21:58.933018+00	2025-07-23 23:21:58.933018+00	2025-07-23 23:21:58.933018+00	{"eTag": "\\"7bab1736425b237392c2e10208c2ddfc\\"", "size": 1215882, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:21:58.926Z", "contentLength": 1215882, "httpStatusCode": 200}	f00e557f-44f3-446e-b663-26dd66bce9f8	\N	{}	1
04831d0f-9ce1-49d8-a74d-f580ce9a1832	pdfs	PA_PRI_Sen_Anabell_Avalos_Memoria_Coronel_Felipe_Santiago.pdf	\N	2025-07-23 23:23:10.195851+00	2025-07-23 23:23:10.195851+00	2025-07-23 23:23:10.195851+00	{"eTag": "\\"9ff8cdace8de581df3117f719528b278\\"", "size": 221828, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:23:10.192Z", "contentLength": 221828, "httpStatusCode": 200}	10861025-8444-4d13-97b9-70c56fa330ac	\N	{}	1
4258255a-428e-429c-8ec1-7d385a12c16a	logo	1753901403472.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-30 18:50:02.224922+00	2025-07-30 18:50:02.224922+00	2025-07-30 18:50:02.224922+00	{"eTag": "\\"86cd8084647ea0460777bbb520273560\\"", "size": 82419, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-30T18:50:02.222Z", "contentLength": 82419, "httpStatusCode": 200}	e6a33745-a643-479c-9850-18388458c3cb	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
638c0384-7bca-41c9-951b-ad4244ee4a76	pdfs	PA_PT_Dip_Ricardo_Mejia_Muerte_Mineros_Pozo_Pinabete_Actualizado_2406025.pdf	\N	2025-07-23 23:27:23.490001+00	2025-07-23 23:27:23.490001+00	2025-07-23 23:27:23.490001+00	{"eTag": "\\"ac6f3cea31a601ba7616e7569181f4a6\\"", "size": 2353028, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:27:23.476Z", "contentLength": 2353028, "httpStatusCode": 200}	39399322-db5e-4638-a5e9-a64330c009d6	\N	{}	1
4b939793-b2be-4f47-b1bb-93242d3935b7	pdfs	PA_PRI_Sen_Anabell_Avalos_Nueva_Planta_Recicladora_Tlaxcala.pdf	\N	2025-07-23 23:11:41.201021+00	2025-07-23 23:11:41.201021+00	2025-07-23 23:11:41.201021+00	{"eTag": "\\"b88631149ca68cf983f6e31d85ec74a6\\"", "size": 306682, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:11:41.198Z", "contentLength": 306682, "httpStatusCode": 200}	282f5fa3-34df-44ea-85b1-6e875f4444c9	\N	{}	1
99adfb42-2a5d-4fef-9baf-12468f069453	logo	1753901406967.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-30 18:50:05.632189+00	2025-07-30 18:50:05.632189+00	2025-07-30 18:50:05.632189+00	{"eTag": "\\"e49444ab4073a6b5896156d37242de05\\"", "size": 15801, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-30T18:50:05.628Z", "contentLength": 15801, "httpStatusCode": 200}	32827de4-af99-42ff-b1f5-29bf6872d897	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
2a0a573c-c36c-45cd-959b-bb4b599693c8	pdfs	Asistencia_CP_20-junio-2025.pdf	\N	2025-07-23 21:32:06.215359+00	2025-07-23 21:32:06.215359+00	2025-07-23 21:32:06.215359+00	{"eTag": "\\"d6adde2901e207ba4a00d29829950a89\\"", "size": 84335, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T21:32:06.212Z", "contentLength": 84335, "httpStatusCode": 200}	9d36e8c7-c712-46e9-b19c-e38b517d3df5	\N	{}	1
d16c75a4-e2ef-439c-8bf9-06618bbdd44e	pdfs	PA_PRI_Sen_Anabell_Avalos_Nombramiento_Secr_Infraestructura_Tlaxcala.pdf	\N	2025-07-23 23:31:34.340654+00	2025-07-23 23:31:34.340654+00	2025-07-23 23:31:34.340654+00	{"eTag": "\\"a19fc2d0705eddf5f1022009f54747b8\\"", "size": 290169, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:31:34.336Z", "contentLength": 290169, "httpStatusCode": 200}	339745cc-d39c-442c-b24a-7df9badb5c2e	\N	{}	1
151b6d2f-27ff-44d9-aa82-aad279d9cc19	logo	1753901916711.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-30 18:58:35.537247+00	2025-07-30 18:58:35.537247+00	2025-07-30 18:58:35.537247+00	{"eTag": "\\"e49444ab4073a6b5896156d37242de05\\"", "size": 15801, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-30T18:58:35.533Z", "contentLength": 15801, "httpStatusCode": 200}	65c53cb2-4b73-494e-90e9-6d52fed760c4	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
ee0dfa3e-5ff2-4bc6-95ef-c1d76f2fbfc6	pdfs	PA_Morena_Sen_Beatriz_Robles_Exhorta_al_Gobernador_de_Queretaro.pdf	\N	2025-07-23 23:32:23.755036+00	2025-07-23 23:32:23.755036+00	2025-07-23 23:32:23.755036+00	{"eTag": "\\"14917bb5abb1d0607163d71392ee9f3b\\"", "size": 2351553, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:32:23.738Z", "contentLength": 2351553, "httpStatusCode": 200}	547e16b6-391c-41ed-b8d9-b64092e470f9	\N	{}	1
d58a7109-548b-4178-8f0f-ce4d5a4e2673	pdfs	Ofic_Informe_Visita_Trabajo_Washington_Sen_Karina_Isabel_Ruiz.pdf	\N	2025-07-23 21:34:39.583334+00	2025-07-23 21:34:39.583334+00	2025-07-23 21:34:39.583334+00	{"eTag": "\\"6619594fde4f39df49992bb2c4d42ab8\\"", "size": 159767, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T21:34:39.580Z", "contentLength": 159767, "httpStatusCode": 200}	8818c8ce-7737-4518-9756-259ec66bbb1f	\N	{}	1
7c452319-db06-4237-a946-834f0afcad7b	pdfs	PA_MC_Sen_Amalia_Medina_Migrantes.pdf	\N	2025-07-23 23:13:46.296063+00	2025-07-23 23:13:46.296063+00	2025-07-23 23:13:46.296063+00	{"eTag": "\\"0d46ce18b60843d66ffe966e5b1706a5\\"", "size": 182067, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T23:13:46.289Z", "contentLength": 182067, "httpStatusCode": 200}	30b2564f-1ed8-4494-825a-04f7758edd39	\N	{}	1
4f43c67f-4fd2-4420-9c2e-69ec7e67a633	logo	1753902068999.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-30 19:01:08.158149+00	2025-07-30 19:01:08.158149+00	2025-07-30 19:01:08.158149+00	{"eTag": "\\"6c9c6cb692811a83f6b5c1323a1a2924\\"", "size": 496921, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-30T19:01:08.153Z", "contentLength": 496921, "httpStatusCode": 200}	f74a65ab-31b2-41de-aed1-6fc4872d7bf0	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
fd6458b6-a766-485a-bd20-78f02ac6fe63	pdfs	Reservas_Dip_Laura_Ballesteros_MC_Art201.pdf	\N	2025-07-23 19:53:33.423316+00	2025-07-23 19:53:33.423316+00	2025-07-23 19:53:33.423316+00	{"eTag": "\\"1e00310bc6b050c075600153f6fa5f75\\"", "size": 158450, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T19:53:33.420Z", "contentLength": 158450, "httpStatusCode": 200}	ea19106e-8604-49a7-8ebd-9050e95449f4	\N	{}	1
16ba32f2-14da-4705-ac68-dc113b678a93	logo	1753313930086.png	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-23 23:39:02.712392+00	2025-07-23 23:39:02.712392+00	2025-07-23 23:39:02.712392+00	{"eTag": "\\"c1f3956d22263ee29098e73162647137\\"", "size": 2859735, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-23T23:39:02.695Z", "contentLength": 2859735, "httpStatusCode": 200}	ad79a40a-8bf4-47ac-8644-fd3147883059	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
b61629a3-f641-4ca0-a2b0-1bf5bce16c0b	documentos	20250325-II-1-1.pdf	\N	2025-07-30 01:40:43.853711+00	2025-07-30 01:40:43.853711+00	2025-07-30 01:40:43.853711+00	{"eTag": "\\"6a7a8530b51bc818911ccc94ab656dda\\"", "size": 9464476, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-30T01:40:43.736Z", "contentLength": 9464476, "httpStatusCode": 200}	af52ddd9-1b1b-4ba2-97de-aefa410ff99b	\N	{}	1
ed2e41e7-f313-4077-9cf2-66b161321d44	pdfs	Informe_Visita_Trabajo_Washington_Sen_Karina_Isabel_Ruiz.pdf	\N	2025-07-23 21:36:16.36263+00	2025-07-23 21:36:16.36263+00	2025-07-23 21:36:16.36263+00	{"eTag": "\\"f770614e756542c83d3cf2325e974715\\"", "size": 1538569, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-23T21:36:16.348Z", "contentLength": 1538569, "httpStatusCode": 200}	a5dae780-e4ee-4ee9-9cd6-0a9db56812d7	\N	{}	1
cfc83cc4-61e8-4b9f-90d1-39e84a6eafea	documentos	20250325-II-1-1_pages_45_to_66.pdf	\N	2025-07-30 01:40:59.031432+00	2025-07-30 01:40:59.031432+00	2025-07-30 01:40:59.031432+00	{"eTag": "\\"0f4184895964737120d940582aaa174c\\"", "size": 607287, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-07-30T01:40:59.002Z", "contentLength": 607287, "httpStatusCode": 200}	c8213740-b29c-417f-a6e5-ede5f40b33c2	\N	{}	1
b8765df7-c31f-4c2e-a8b5-c294809dd589	logo	1753120471790.jpg	3de786b3-753d-4aa5-a52d-9ca91808c08b	2025-07-21 17:54:33.551478+00	2025-07-21 17:54:33.551478+00	2025-07-21 17:54:33.551478+00	{"eTag": "\\"5ba73d7fcd779f2fb331a3888ecef5fa\\"", "size": 66060, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-07-21T17:54:33.547Z", "contentLength": 66060, "httpStatusCode": 200}	9a0debdf-6b31-4bef-8367-cdb8ffce2993	3de786b3-753d-4aa5-a52d-9ca91808c08b	{}	1
ad4a9efd-fe0f-4d88-a22a-aef3d94be87a	logo	1753312442440.png	305bfa9c-6966-4043-a194-e9d0bf060f28	2025-07-23 23:14:01.867095+00	2025-07-23 23:14:01.867095+00	2025-07-23 23:14:01.867095+00	{"eTag": "\\"63aa7161ba470c2e83c1d35363178522\\"", "size": 52922, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-07-23T23:14:01.865Z", "contentLength": 52922, "httpStatusCode": 200}	65a2b72b-773b-4eda-a293-c245b12daf95	305bfa9c-6966-4043-a194-e9d0bf060f28	{}	1
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-05-21 05:28:57.795432+00
20210809183423_update_grants	2025-05-21 05:28:57.795432+00
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 327, true);


--
-- Name: alertas_directorio_id_alerta_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.alertas_directorio_id_alerta_seq', 42, true);


--
-- Name: bot_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.bot_executions_id_seq', 1, false);


--
-- Name: clientes_id_cliente_numerico_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.clientes_id_cliente_numerico_seq', 9, true);


--
-- Name: emails_id_email_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.emails_id_email_seq', 1, true);


--
-- Name: empresas_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.empresas_id_empresa_seq', 4, true);


--
-- Name: gep_ia_attributes_id_attribute_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.gep_ia_attributes_id_attribute_seq', 8, true);


--
-- Name: gep_ia_personas_id_person_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.gep_ia_personas_id_person_seq', 6, true);


--
-- Name: gep_ia_relation_type_id_type_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.gep_ia_relation_type_id_type_relation_id_seq', 3, true);


--
-- Name: gep_ia_relations_id_relation_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.gep_ia_relations_id_relation_seq', 4, true);


--
-- Name: listaod_seandores_diputados_id_funcionario_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.listaod_seandores_diputados_id_funcionario_seq', 757, true);


--
-- Name: logs_debots_id_log_bot_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.logs_debots_id_log_bot_seq', 1, false);


--
-- Name: scrape_busquedas_id_scrape_busqueda_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.scrape_busquedas_id_scrape_busqueda_seq', 1, true);


--
-- Name: scrape_tw_cuentas_id_scrape_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.scrape_tw_cuentas_id_scrape_seq', 7, true);


--
-- Name: senado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.senado_id_seq', 4150, true);


--
-- Name: subtemas_id_subtema_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.subtemas_id_subtema_seq', 356, true);


--
-- Name: temas_id_tema_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.temas_id_tema_seq', 56, true);


--
-- Name: unidades_empresas_id_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.unidades_empresas_id_unidad_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 12, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: alertas_directorio alertas_directorio_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.alertas_directorio
    ADD CONSTRAINT alertas_directorio_pkey PRIMARY KEY (id_alerta);


--
-- Name: bot_executions bot_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.bot_executions
    ADD CONSTRAINT bot_executions_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- Name: emails emails_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id_email);


--
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id_empresa);


--
-- Name: gep_ia_attributes gep_ia_attributes_id_attribute_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_attributes
    ADD CONSTRAINT gep_ia_attributes_id_attribute_key UNIQUE (id_attribute);


--
-- Name: gep_ia_attributes gep_ia_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_attributes
    ADD CONSTRAINT gep_ia_attributes_pkey PRIMARY KEY (id_attribute);


--
-- Name: gep_ia_personas gep_ia_personas_id_person_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_personas
    ADD CONSTRAINT gep_ia_personas_id_person_key UNIQUE (id_person);


--
-- Name: gep_ia_personas gep_ia_personas_person_full_name_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_personas
    ADD CONSTRAINT gep_ia_personas_person_full_name_key UNIQUE (person_full_name);


--
-- Name: gep_ia_personas gep_ia_personas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_personas
    ADD CONSTRAINT gep_ia_personas_pkey PRIMARY KEY (id_person);


--
-- Name: gep_ia_relation_type gep_ia_relation_type_id_type_relation_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_relation_type
    ADD CONSTRAINT gep_ia_relation_type_id_type_relation_id_key UNIQUE (id_type_relation_id);


--
-- Name: gep_ia_relation_type gep_ia_relation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_relation_type
    ADD CONSTRAINT gep_ia_relation_type_pkey PRIMARY KEY (id_type_relation_id);


--
-- Name: gep_ia_relations gep_ia_relations_id_relation_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_relations
    ADD CONSTRAINT gep_ia_relations_id_relation_key UNIQUE (id_relation);


--
-- Name: gep_ia_relations gep_ia_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.gep_ia_relations
    ADD CONSTRAINT gep_ia_relations_pkey PRIMARY KEY (id_relation);


--
-- Name: listaod_seandores_diputados listaod_seandores_diputados_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.listaod_seandores_diputados
    ADD CONSTRAINT listaod_seandores_diputados_pkey PRIMARY KEY (id_funcionario);


--
-- Name: logs_de_bots logs_debots_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.logs_de_bots
    ADD CONSTRAINT logs_debots_pkey PRIMARY KEY (id_log_bot);


--
-- Name: scrape_busquedas scrape_busquedas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scrape_busquedas
    ADD CONSTRAINT scrape_busquedas_pkey PRIMARY KEY (id_scrape_busqueda);


--
-- Name: scrape_tw_cuentas scrape_tw_cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scrape_tw_cuentas
    ADD CONSTRAINT scrape_tw_cuentas_pkey PRIMARY KEY (id_scrape);


--
-- Name: senado senado_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.senado
    ADD CONSTRAINT senado_pkey PRIMARY KEY (id_senado_doc);


--
-- Name: subtemas subtemas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.subtemas
    ADD CONSTRAINT subtemas_pkey PRIMARY KEY (id_subtema);


--
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (id_tema);


--
-- Name: unidades_empresas unidades_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.unidades_empresas
    ADD CONSTRAINT unidades_empresas_pkey PRIMARY KEY (id_unidad);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_alertas_estado_rechazo; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_alertas_estado_rechazo ON public.alertas_directorio USING btree (estado);


--
-- Name: idx_alertas_fuente; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_alertas_fuente ON public.alertas_directorio USING btree (fuente);


--
-- Name: idx_alertas_status; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_alertas_status ON public.alertas_directorio USING btree (status_alerta);


--
-- Name: idx_bot_executions_fecha_desc; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_bot_executions_fecha_desc ON public.bot_executions USING btree (fecha DESC);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: alertas_directorio alertas_directorio_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.alertas_directorio
    ADD CONSTRAINT alertas_directorio_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- Name: alertas_directorio alertas_directorio_id_doc_senado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.alertas_directorio
    ADD CONSTRAINT alertas_directorio_id_doc_senado_fkey FOREIGN KEY (id_doc_senado) REFERENCES public.senado(id_senado_doc);


--
-- Name: scrape_tw_cuentas scrape_tw_cuentas_id_scrape_busqueda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scrape_tw_cuentas
    ADD CONSTRAINT scrape_tw_cuentas_id_scrape_busqueda_fkey FOREIGN KEY (id_scrape_busqueda) REFERENCES public.scrape_busquedas(id_scrape_busqueda);


--
-- Name: usuarios usuarios_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: alertas_directorio; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.alertas_directorio ENABLE ROW LEVEL SECURITY;

--
-- Name: bot_executions; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.bot_executions ENABLE ROW LEVEL SECURITY;

--
-- Name: emails; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.emails ENABLE ROW LEVEL SECURITY;

--
-- Name: gep_ia_attributes; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_attributes ENABLE ROW LEVEL SECURITY;

--
-- Name: gep_ia_personas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_personas ENABLE ROW LEVEL SECURITY;

--
-- Name: gep_ia_relation_type; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_relation_type ENABLE ROW LEVEL SECURITY;

--
-- Name: gep_ia_relations; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.gep_ia_relations ENABLE ROW LEVEL SECURITY;

--
-- Name: listaod_seandores_diputados; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.listaod_seandores_diputados ENABLE ROW LEVEL SECURITY;

--
-- Name: logs_de_bots; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.logs_de_bots ENABLE ROW LEVEL SECURITY;

--
-- Name: scrape_busquedas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.scrape_busquedas ENABLE ROW LEVEL SECURITY;

--
-- Name: scrape_tw_cuentas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.scrape_tw_cuentas ENABLE ROW LEVEL SECURITY;

--
-- Name: alertas_directorio todas; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY todas ON public.alertas_directorio USING (true);


--
-- Name: empresas todo; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY todo ON public.empresas USING (true);


--
-- Name: senado todo; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY todo ON public.senado USING (true);


--
-- Name: subtemas todos; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY todos ON public.subtemas USING (true);


--
-- Name: temas todos; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY todos ON public.temas USING (true);


--
-- Name: unidades_empresas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.unidades_empresas ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: objects lgoos 1zbfv_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "lgoos 1zbfv_0" ON storage.objects FOR SELECT USING ((bucket_id = 'logo'::text));


--
-- Name: objects lgoos 1zbfv_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "lgoos 1zbfv_1" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'logo'::text));


--
-- Name: objects lgoos 1zbfv_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "lgoos 1zbfv_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'logo'::text));


--
-- Name: objects lgoos 1zbfv_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "lgoos 1zbfv_3" ON storage.objects FOR DELETE USING ((bucket_id = 'logo'::text));


--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime alertas_directorio; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.alertas_directorio;


--
-- Name: supabase_realtime senado; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.senado;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION halfvec_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION halfvec_out(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION halfvec_send(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION sparsevec_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION sparsevec_out(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION sparsevec_send(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION vector_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION vector_out(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_out(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO service_role;


--
-- Name: FUNCTION vector_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION vector_send(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_send(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO service_role;


--
-- Name: FUNCTION vector_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_sparsevec(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_sparsevec(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_float4(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_sparsevec(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_vector(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec_to_halfvec(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec_to_vector(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_float4(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_halfvec(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_sparsevec(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION binary_quantize(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO service_role;


--
-- Name: FUNCTION binary_quantize(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO anon;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO service_role;


--
-- Name: FUNCTION buscar_diputados(palabras text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.buscar_diputados(palabras text) TO postgres;
GRANT ALL ON FUNCTION public.buscar_diputados(palabras text) TO anon;
GRANT ALL ON FUNCTION public.buscar_diputados(palabras text) TO authenticated;
GRANT ALL ON FUNCTION public.buscar_diputados(palabras text) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION halfvec_accum(double precision[], public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_add(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_avg(double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO service_role;


--
-- Name: FUNCTION halfvec_cmp(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_combine(double precision[], double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO service_role;


--
-- Name: FUNCTION halfvec_concat(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_eq(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_ge(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_gt(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_l2_squared_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_le(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_lt(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_mul(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_ne(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_negative_inner_product(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_spherical_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_sub(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION hamming_distance(bit, bit); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO postgres;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO anon;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO authenticated;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO service_role;


--
-- Name: FUNCTION hnsw_bit_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO service_role;


--
-- Name: FUNCTION hnsw_halfvec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO service_role;


--
-- Name: FUNCTION hnsw_sparsevec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO service_role;


--
-- Name: FUNCTION hnswhandler(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnswhandler(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO anon;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO service_role;


--
-- Name: FUNCTION inner_product(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION inner_product(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION inner_product(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION ivfflat_bit_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO service_role;


--
-- Name: FUNCTION ivfflat_halfvec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO service_role;


--
-- Name: FUNCTION ivfflathandler(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO service_role;


--
-- Name: FUNCTION jaccard_distance(bit, bit); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO postgres;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO anon;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO authenticated;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO service_role;


--
-- Name: FUNCTION l1_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION l1_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION l1_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION l2_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION l2_norm(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_norm(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO service_role;


--
-- Name: FUNCTION match_documentos(query_embedding public.vector, match_count integer, filter jsonb); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.match_documentos(query_embedding public.vector, match_count integer, filter jsonb) TO postgres;
GRANT ALL ON FUNCTION public.match_documentos(query_embedding public.vector, match_count integer, filter jsonb) TO anon;
GRANT ALL ON FUNCTION public.match_documentos(query_embedding public.vector, match_count integer, filter jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.match_documentos(query_embedding public.vector, match_count integer, filter jsonb) TO service_role;


--
-- Name: FUNCTION match_documents_diputados(query_embedding public.vector, match_count integer, filter jsonb); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.match_documents_diputados(query_embedding public.vector, match_count integer, filter jsonb) TO postgres;
GRANT ALL ON FUNCTION public.match_documents_diputados(query_embedding public.vector, match_count integer, filter jsonb) TO anon;
GRANT ALL ON FUNCTION public.match_documents_diputados(query_embedding public.vector, match_count integer, filter jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.match_documents_diputados(query_embedding public.vector, match_count integer, filter jsonb) TO service_role;


--
-- Name: FUNCTION sparsevec_cmp(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_eq(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_ge(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_gt(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_le(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_lt(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_ne(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_negative_inner_product(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION subvector(public.halfvec, integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO anon;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO service_role;


--
-- Name: FUNCTION subvector(public.vector, integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO anon;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO service_role;


--
-- Name: FUNCTION unaccent(text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent(text) TO postgres;
GRANT ALL ON FUNCTION public.unaccent(text) TO anon;
GRANT ALL ON FUNCTION public.unaccent(text) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent(text) TO service_role;


--
-- Name: FUNCTION unaccent(regdictionary, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO postgres;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO anon;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO service_role;


--
-- Name: FUNCTION unaccent_init(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent_init(internal) TO postgres;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO anon;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO service_role;


--
-- Name: FUNCTION unaccent_lexize(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO service_role;


--
-- Name: FUNCTION vector_accum(double precision[], public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO service_role;


--
-- Name: FUNCTION vector_add(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_avg(double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO anon;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO service_role;


--
-- Name: FUNCTION vector_cmp(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_combine(double precision[], double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO anon;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO service_role;


--
-- Name: FUNCTION vector_concat(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_dims(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO service_role;


--
-- Name: FUNCTION vector_dims(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO service_role;


--
-- Name: FUNCTION vector_eq(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_ge(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_gt(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_l2_squared_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_le(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_lt(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_mul(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_ne(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_negative_inner_product(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_norm(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO service_role;


--
-- Name: FUNCTION vector_spherical_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_sub(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION avg(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO service_role;


--
-- Name: FUNCTION avg(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.avg(public.vector) TO anon;
GRANT ALL ON FUNCTION public.avg(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.avg(public.vector) TO service_role;


--
-- Name: FUNCTION sum(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO service_role;


--
-- Name: FUNCTION sum(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.sum(public.vector) TO anon;
GRANT ALL ON FUNCTION public.sum(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.sum(public.vector) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE alertas_directorio; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.alertas_directorio TO postgres;
GRANT ALL ON TABLE public.alertas_directorio TO anon;
GRANT ALL ON TABLE public.alertas_directorio TO authenticated;
GRANT ALL ON TABLE public.alertas_directorio TO service_role;


--
-- Name: SEQUENCE alertas_directorio_id_alerta_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.alertas_directorio_id_alerta_seq TO postgres;
GRANT ALL ON SEQUENCE public.alertas_directorio_id_alerta_seq TO anon;
GRANT ALL ON SEQUENCE public.alertas_directorio_id_alerta_seq TO authenticated;
GRANT ALL ON SEQUENCE public.alertas_directorio_id_alerta_seq TO service_role;


--
-- Name: TABLE bot_executions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.bot_executions TO postgres;
GRANT ALL ON TABLE public.bot_executions TO anon;
GRANT ALL ON TABLE public.bot_executions TO authenticated;
GRANT ALL ON TABLE public.bot_executions TO service_role;


--
-- Name: SEQUENCE bot_executions_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.bot_executions_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.bot_executions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.bot_executions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.bot_executions_id_seq TO service_role;


--
-- Name: TABLE clientes; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.clientes TO postgres;
GRANT ALL ON TABLE public.clientes TO anon;
GRANT ALL ON TABLE public.clientes TO authenticated;
GRANT ALL ON TABLE public.clientes TO service_role;


--
-- Name: SEQUENCE clientes_id_cliente_numerico_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.clientes_id_cliente_numerico_seq TO postgres;
GRANT ALL ON SEQUENCE public.clientes_id_cliente_numerico_seq TO anon;
GRANT ALL ON SEQUENCE public.clientes_id_cliente_numerico_seq TO authenticated;
GRANT ALL ON SEQUENCE public.clientes_id_cliente_numerico_seq TO service_role;


--
-- Name: TABLE emails; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.emails TO postgres;
GRANT ALL ON TABLE public.emails TO anon;
GRANT ALL ON TABLE public.emails TO authenticated;
GRANT ALL ON TABLE public.emails TO service_role;


--
-- Name: SEQUENCE emails_id_email_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.emails_id_email_seq TO postgres;
GRANT ALL ON SEQUENCE public.emails_id_email_seq TO anon;
GRANT ALL ON SEQUENCE public.emails_id_email_seq TO authenticated;
GRANT ALL ON SEQUENCE public.emails_id_email_seq TO service_role;


--
-- Name: TABLE empresas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.empresas TO postgres;
GRANT ALL ON TABLE public.empresas TO anon;
GRANT ALL ON TABLE public.empresas TO authenticated;
GRANT ALL ON TABLE public.empresas TO service_role;


--
-- Name: SEQUENCE empresas_id_empresa_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.empresas_id_empresa_seq TO postgres;
GRANT ALL ON SEQUENCE public.empresas_id_empresa_seq TO anon;
GRANT ALL ON SEQUENCE public.empresas_id_empresa_seq TO authenticated;
GRANT ALL ON SEQUENCE public.empresas_id_empresa_seq TO service_role;


--
-- Name: TABLE gep_ia_attributes; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.gep_ia_attributes TO postgres;
GRANT ALL ON TABLE public.gep_ia_attributes TO anon;
GRANT ALL ON TABLE public.gep_ia_attributes TO authenticated;
GRANT ALL ON TABLE public.gep_ia_attributes TO service_role;


--
-- Name: SEQUENCE gep_ia_attributes_id_attribute_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.gep_ia_attributes_id_attribute_seq TO postgres;
GRANT ALL ON SEQUENCE public.gep_ia_attributes_id_attribute_seq TO anon;
GRANT ALL ON SEQUENCE public.gep_ia_attributes_id_attribute_seq TO authenticated;
GRANT ALL ON SEQUENCE public.gep_ia_attributes_id_attribute_seq TO service_role;


--
-- Name: TABLE gep_ia_personas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.gep_ia_personas TO postgres;
GRANT ALL ON TABLE public.gep_ia_personas TO anon;
GRANT ALL ON TABLE public.gep_ia_personas TO authenticated;
GRANT ALL ON TABLE public.gep_ia_personas TO service_role;


--
-- Name: SEQUENCE gep_ia_personas_id_person_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.gep_ia_personas_id_person_seq TO postgres;
GRANT ALL ON SEQUENCE public.gep_ia_personas_id_person_seq TO anon;
GRANT ALL ON SEQUENCE public.gep_ia_personas_id_person_seq TO authenticated;
GRANT ALL ON SEQUENCE public.gep_ia_personas_id_person_seq TO service_role;


--
-- Name: TABLE gep_ia_relation_type; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.gep_ia_relation_type TO postgres;
GRANT ALL ON TABLE public.gep_ia_relation_type TO anon;
GRANT ALL ON TABLE public.gep_ia_relation_type TO authenticated;
GRANT ALL ON TABLE public.gep_ia_relation_type TO service_role;


--
-- Name: SEQUENCE gep_ia_relation_type_id_type_relation_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.gep_ia_relation_type_id_type_relation_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.gep_ia_relation_type_id_type_relation_id_seq TO anon;
GRANT ALL ON SEQUENCE public.gep_ia_relation_type_id_type_relation_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.gep_ia_relation_type_id_type_relation_id_seq TO service_role;


--
-- Name: TABLE gep_ia_relations; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.gep_ia_relations TO postgres;
GRANT ALL ON TABLE public.gep_ia_relations TO anon;
GRANT ALL ON TABLE public.gep_ia_relations TO authenticated;
GRANT ALL ON TABLE public.gep_ia_relations TO service_role;


--
-- Name: SEQUENCE gep_ia_relations_id_relation_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.gep_ia_relations_id_relation_seq TO postgres;
GRANT ALL ON SEQUENCE public.gep_ia_relations_id_relation_seq TO anon;
GRANT ALL ON SEQUENCE public.gep_ia_relations_id_relation_seq TO authenticated;
GRANT ALL ON SEQUENCE public.gep_ia_relations_id_relation_seq TO service_role;


--
-- Name: TABLE listaod_seandores_diputados; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.listaod_seandores_diputados TO postgres;
GRANT ALL ON TABLE public.listaod_seandores_diputados TO anon;
GRANT ALL ON TABLE public.listaod_seandores_diputados TO authenticated;
GRANT ALL ON TABLE public.listaod_seandores_diputados TO service_role;


--
-- Name: SEQUENCE listaod_seandores_diputados_id_funcionario_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.listaod_seandores_diputados_id_funcionario_seq TO postgres;
GRANT ALL ON SEQUENCE public.listaod_seandores_diputados_id_funcionario_seq TO anon;
GRANT ALL ON SEQUENCE public.listaod_seandores_diputados_id_funcionario_seq TO authenticated;
GRANT ALL ON SEQUENCE public.listaod_seandores_diputados_id_funcionario_seq TO service_role;


--
-- Name: TABLE logs_de_bots; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.logs_de_bots TO postgres;
GRANT ALL ON TABLE public.logs_de_bots TO anon;
GRANT ALL ON TABLE public.logs_de_bots TO authenticated;
GRANT ALL ON TABLE public.logs_de_bots TO service_role;


--
-- Name: SEQUENCE logs_debots_id_log_bot_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.logs_debots_id_log_bot_seq TO postgres;
GRANT ALL ON SEQUENCE public.logs_debots_id_log_bot_seq TO anon;
GRANT ALL ON SEQUENCE public.logs_debots_id_log_bot_seq TO authenticated;
GRANT ALL ON SEQUENCE public.logs_debots_id_log_bot_seq TO service_role;


--
-- Name: TABLE scrape_busquedas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.scrape_busquedas TO postgres;
GRANT ALL ON TABLE public.scrape_busquedas TO anon;
GRANT ALL ON TABLE public.scrape_busquedas TO authenticated;
GRANT ALL ON TABLE public.scrape_busquedas TO service_role;


--
-- Name: SEQUENCE scrape_busquedas_id_scrape_busqueda_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.scrape_busquedas_id_scrape_busqueda_seq TO postgres;
GRANT ALL ON SEQUENCE public.scrape_busquedas_id_scrape_busqueda_seq TO anon;
GRANT ALL ON SEQUENCE public.scrape_busquedas_id_scrape_busqueda_seq TO authenticated;
GRANT ALL ON SEQUENCE public.scrape_busquedas_id_scrape_busqueda_seq TO service_role;


--
-- Name: TABLE scrape_tw_cuentas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.scrape_tw_cuentas TO postgres;
GRANT ALL ON TABLE public.scrape_tw_cuentas TO anon;
GRANT ALL ON TABLE public.scrape_tw_cuentas TO authenticated;
GRANT ALL ON TABLE public.scrape_tw_cuentas TO service_role;


--
-- Name: SEQUENCE scrape_tw_cuentas_id_scrape_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.scrape_tw_cuentas_id_scrape_seq TO postgres;
GRANT ALL ON SEQUENCE public.scrape_tw_cuentas_id_scrape_seq TO anon;
GRANT ALL ON SEQUENCE public.scrape_tw_cuentas_id_scrape_seq TO authenticated;
GRANT ALL ON SEQUENCE public.scrape_tw_cuentas_id_scrape_seq TO service_role;


--
-- Name: TABLE senado; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.senado TO postgres;
GRANT ALL ON TABLE public.senado TO anon;
GRANT ALL ON TABLE public.senado TO authenticated;
GRANT ALL ON TABLE public.senado TO service_role;


--
-- Name: SEQUENCE senado_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.senado_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.senado_id_seq TO anon;
GRANT ALL ON SEQUENCE public.senado_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.senado_id_seq TO service_role;


--
-- Name: TABLE subtemas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.subtemas TO postgres;
GRANT ALL ON TABLE public.subtemas TO anon;
GRANT ALL ON TABLE public.subtemas TO authenticated;
GRANT ALL ON TABLE public.subtemas TO service_role;


--
-- Name: SEQUENCE subtemas_id_subtema_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.subtemas_id_subtema_seq TO postgres;
GRANT ALL ON SEQUENCE public.subtemas_id_subtema_seq TO anon;
GRANT ALL ON SEQUENCE public.subtemas_id_subtema_seq TO authenticated;
GRANT ALL ON SEQUENCE public.subtemas_id_subtema_seq TO service_role;


--
-- Name: TABLE temas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.temas TO postgres;
GRANT ALL ON TABLE public.temas TO anon;
GRANT ALL ON TABLE public.temas TO authenticated;
GRANT ALL ON TABLE public.temas TO service_role;


--
-- Name: SEQUENCE temas_id_tema_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.temas_id_tema_seq TO postgres;
GRANT ALL ON SEQUENCE public.temas_id_tema_seq TO anon;
GRANT ALL ON SEQUENCE public.temas_id_tema_seq TO authenticated;
GRANT ALL ON SEQUENCE public.temas_id_tema_seq TO service_role;


--
-- Name: TABLE unidades_empresas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.unidades_empresas TO postgres;
GRANT ALL ON TABLE public.unidades_empresas TO anon;
GRANT ALL ON TABLE public.unidades_empresas TO authenticated;
GRANT ALL ON TABLE public.unidades_empresas TO service_role;


--
-- Name: SEQUENCE unidades_empresas_id_unidad_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.unidades_empresas_id_unidad_seq TO postgres;
GRANT ALL ON SEQUENCE public.unidades_empresas_id_unidad_seq TO anon;
GRANT ALL ON SEQUENCE public.unidades_empresas_id_unidad_seq TO authenticated;
GRANT ALL ON SEQUENCE public.unidades_empresas_id_unidad_seq TO service_role;


--
-- Name: TABLE usuarios; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.usuarios TO postgres;
GRANT ALL ON TABLE public.usuarios TO anon;
GRANT ALL ON TABLE public.usuarios TO authenticated;
GRANT ALL ON TABLE public.usuarios TO service_role;


--
-- Name: SEQUENCE usuarios_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.usuarios_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.usuarios_id_seq TO anon;
GRANT ALL ON SEQUENCE public.usuarios_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.usuarios_id_seq TO service_role;


--
-- Name: TABLE vista_relaciones_con_atributos; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.vista_relaciones_con_atributos TO postgres;
GRANT ALL ON TABLE public.vista_relaciones_con_atributos TO anon;
GRANT ALL ON TABLE public.vista_relaciones_con_atributos TO authenticated;
GRANT ALL ON TABLE public.vista_relaciones_con_atributos TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,DELETE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

