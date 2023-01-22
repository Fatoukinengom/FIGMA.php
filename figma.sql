if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOUER') and o.name = 'FK_LOUER_LOUER_STUDENT')
alter table LOUER
   drop constraint FK_LOUER_LOUER_STUDENT
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOUER') and o.name = 'FK_LOUER_LOUER2_ROOM')
alter table LOUER
   drop constraint FK_LOUER_LOUER2_ROOM
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROOM') and o.name = 'FK_ROOM_INTEGRER_BTIMENT')
alter table ROOM
   drop constraint FK_ROOM_INTEGRER_BTIMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BTIMENT')
            and   type = 'U')
   drop table BTIMENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOUER')
            and   type = 'U')
   drop table LOUER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROOM')
            and   type = 'U')
   drop table ROOM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STUDENT')
            and   type = 'U')
   drop table STUDENT
go

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create table ADMIN (
   ID                   int                  null,
   LIBELLE              int                  null
)
go

/*==============================================================*/
/* Table : BTIMENT                                              */
/*==============================================================*/
create table BTIMENT (
   NOM                  char(256)            null,
   ADRESSE              char(256)            null,
   LIBELLE              int                  null
)
go

/*==============================================================*/
/* Table : LOUER                                                */
/*==============================================================*/
create table LOUER (
   
)
go

/*==============================================================*/
/* Table : ROOM                                                 */
/*==============================================================*/
create table ROOM (
   NOM                  char(256)            null,
   CODE                 int                  null
)
go

/*==============================================================*/
/* Table : STUDENT                                              */
/*==============================================================*/
create table STUDENT (
   NOM                  char(256)            null,
   PRENOM               char(256)            null,
   CODE                 int                  null,
   ADRESSE              char(256)            null
)
go

alter table LOUER
   add constraint FK_LOUER_LOUER_STUDENT foreign key ()
      references STUDENT
go

alter table LOUER
   add constraint FK_LOUER_LOUER2_ROOM foreign key ()
      references ROOM
go

alter table ROOM
   add constraint FK_ROOM_INTEGRER_BTIMENT foreign key ()
      references BTIMENT
go
