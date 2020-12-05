create table item
(
    id uniqueidentifier default newid() not null
        constraint item_pk
            primary key nonclustered,
    title text not null,
    description text
)
go

create unique index item_id_uindex
    on item (id)
go
