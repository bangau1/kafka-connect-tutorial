create table IF NOT EXISTS public.users(
  id int PRIMARY KEY, 
  name varchar(15), 
  address varchar(15), 
  timestamp timestamp default current_timestamp
);

INSERT INTO public.users(id, name, address)
VALUES (1, 'Agung Pratama', 'Cibinong, Bogor')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users(id, name, address)
VALUES (2, 'Annisa', 'Cibinong, Bogor')
ON CONFLICT (id) DO NOTHING;
