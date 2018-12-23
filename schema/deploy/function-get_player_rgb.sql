-- Deploy schemaverse:function-get_player_rgb to pg

BEGIN;

CREATE OR REPLACE FUNCTION public.get_player_rgb(check_id integer)
 RETURNS character
 LANGUAGE sql
 STABLE SECURITY DEFINER
AS $function$
SELECT rgb FROM public.player WHERE id=$1;
$function$;

CREATE OR REPLACE FUNCTION public.get_player_rgb(check_username name)
 RETURNS character
 LANGUAGE sql
 STABLE SECURITY DEFINER
AS $function$
SELECT rgb FROM public.player WHERE username=$1;
$function$;


GRANT EXECUTE ON FUNCTION public.get_player_rgb(integer) TO players;
GRANT EXECUTE ON FUNCTION public.get_player_rgb(name) TO players;

COMMIT;
