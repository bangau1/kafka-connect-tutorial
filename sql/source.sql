create table IF NOT EXISTS public.users(
  id int PRIMARY KEY, 
  name varchar(15), 
  address varchar(15), 
  timestamp timestamp with time zone default current_timestamp NOT NULL
);

CREATE INDEX users_timestamp on public.users(timestamp ASC);

INSERT INTO public.users(id, name, address)
VALUES (1, 'Agung Pratama', 'Cibinong, Bogor')
ON CONFLICT (id) DO NOTHING;

select pg_sleep(5);
INSERT INTO public.users(id, name, address)
VALUES (2, 'Annisa', 'Cibinong, Bogor')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users(id, name, address)
VALUES (3, 'Aqilla', 'Cibinong, Bogor')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users(id, name, address)
VALUES (4, 'Akbar', 'Serang, Banten')
ON CONFLICT (id) DO NOTHING;
