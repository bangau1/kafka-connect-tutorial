INSERT INTO public.users(id, name, address)
VALUES (1, 'Agung Pratama', 'Cibinong, Bogor')
ON CONFLICT (id) DO UPDATE SET timestamp = current_timestamp;
select pg_sleep(1);


INSERT INTO public.users(id, name, address)
VALUES (2, 'Annisa', 'Cibinong, Bogor')
ON CONFLICT (id) DO UPDATE SET timestamp = current_timestamp;
select pg_sleep(1);

INSERT INTO public.users(id, name, address)
VALUES (3, 'Aqilla', 'Cibinong, Bogor')
ON CONFLICT (id) DO UPDATE SET timestamp = current_timestamp;
select pg_sleep(1);

INSERT INTO public.users(id, name, address)
VALUES (4, 'Akbar', 'Serang, Banten')
ON CONFLICT (id) DO UPDATE SET timestamp = current_timestamp;
select pg_sleep(1);
