/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/20/2023 1:05:35 PM                        */
/*==============================================================*/


alter table METODE_PEMBAYARAN__PAYMENT_METHOD_ 
   drop foreign key FK_METODE_P_DIGUNAKAN_PRODUK__;

alter table METODE_PEMBAYARAN__PAYMENT_METHOD_ 
   drop foreign key FK_METODE_P_MENGGUNAK_PESANAN_;

alter table PENGIRIMAN_SHIPMENT_ 
   drop foreign key FK_PENGIRIM_MELAKUKAN_PENJUAL_;

alter table PENJUAL__SELLER_ 
   drop foreign key FK_PENJUAL__DIJUAL_PRODUK__;

alter table PESANAN__ORDER_ 
   drop foreign key FK_PESANAN__MEMBUAT_PELANGGA;

alter table STATUS_PENGIRIMAN__SHIPMENT_STATUS_ 
   drop foreign key FK_STATUS_P_MEMILIKI_PENGIRIM;


alter table METODE_PEMBAYARAN__PAYMENT_METHOD_ 
   drop foreign key FK_METODE_P_MENGGUNAK_PESANAN_;

alter table METODE_PEMBAYARAN__PAYMENT_METHOD_ 
   drop foreign key FK_METODE_P_DIGUNAKAN_PRODUK__;

drop table if exists METODE_PEMBAYARAN__PAYMENT_METHOD_;

drop table if exists PELANGGAN__CUSTOMER_;


alter table PENGIRIMAN_SHIPMENT_ 
   drop foreign key FK_PENGIRIM_MELAKUKAN_PENJUAL_;

drop table if exists PENGIRIMAN_SHIPMENT_;


alter table PENJUAL__SELLER_ 
   drop foreign key FK_PENJUAL__DIJUAL_PRODUK__;

drop table if exists PENJUAL__SELLER_;


alter table PESANAN__ORDER_ 
   drop foreign key FK_PESANAN__MEMBUAT_PELANGGA;

drop table if exists PESANAN__ORDER_;

drop table if exists PRODUK__PRODUCT_;


alter table STATUS_PENGIRIMAN__SHIPMENT_STATUS_ 
   drop foreign key FK_STATUS_P_MEMILIKI_PENGIRIM;

drop table if exists STATUS_PENGIRIMAN__SHIPMENT_STATUS_;

/*==============================================================*/
/* Table: METODE_PEMBAYARAN__PAYMENT_METHOD_                    */
/*==============================================================*/
create table METODE_PEMBAYARAN__PAYMENT_METHOD_
(
   ID_METODE_PEMBAYARAN int not null  comment '',
   ID_PRODUK            int  comment '',
   ID_PESANAN           int  comment '',
   JENIS_PEMBAYARAN     varchar(50)  comment '',
   NO_KARTU             varchar(50)  comment '',
   STATUS_PEMBAYARAN    varchar(50)  comment '',
   primary key (ID_METODE_PEMBAYARAN)
);

/*==============================================================*/
/* Table: PELANGGAN__CUSTOMER_                                  */
/*==============================================================*/
create table PELANGGAN__CUSTOMER_
(
   ID_PELANGGAN         int not null  comment '',
   NAMA_PELANGGAN       varchar(50)  comment '',
   ALAMAT_PELANGGAN     varchar(50)  comment '',
   NO_TELEPON_PELANGGAN varchar(12)  comment '',
   EMAIL_PELANGGAN      varchar(30)  comment '',
   primary key (ID_PELANGGAN)
);

/*==============================================================*/
/* Table: PENGIRIMAN_SHIPMENT_                                  */
/*==============================================================*/
create table PENGIRIMAN_SHIPMENT_
(
   ID_PENGIRIMAN        int not null  comment '',
   ID_PENJUAL           int  comment '',
   TANGGAL_PENGIRIMAN   varchar(50)  comment '',
   ALAMAT_PEGNGIRIMAN   varchar(50)  comment '',
   NO_RESI              int  comment '',
   primary key (ID_PENGIRIMAN)
);

/*==============================================================*/
/* Table: PENJUAL__SELLER_                                      */
/*==============================================================*/
create table PENJUAL__SELLER_
(
   ID_PENJUAL           int not null  comment '',
   ID_PRODUK            int  comment '',
   NAMA_TOKO            varchar(50)  comment '',
   ALAMAT_TOKO          varchar(50)  comment '',
   NO_TELEPON_TOKO      varchar(12)  comment '',
   EMAIL_TOKO           varchar(30)  comment '',
   primary key (ID_PENJUAL)
);

/*==============================================================*/
/* Table: PESANAN__ORDER_                                       */
/*==============================================================*/
create table PESANAN__ORDER_
(
   ID_PESANAN           int not null  comment '',
   ID_PELANGGAN         int  comment '',
   TANGGAL_PESANAN      varchar(50)  comment '',
   STATUS_PEMESANAN     varchar(50)  comment '',
   primary key (ID_PESANAN)
);

/*==============================================================*/
/* Table: PRODUK__PRODUCT_                                      */
/*==============================================================*/
create table PRODUK__PRODUCT_
(
   ID_PRODUK            int not null  comment '',
   NAMA_PRODUK          varchar(50)  comment '',
   HARGA                varchar(50)  comment '',
   DESKRIPSI            varchar(50)  comment '',
   primary key (ID_PRODUK)
);

/*==============================================================*/
/* Table: STATUS_PENGIRIMAN__SHIPMENT_STATUS_                   */
/*==============================================================*/
create table STATUS_PENGIRIMAN__SHIPMENT_STATUS_
(
   ID_STATUS            int not null  comment '',
   ID_PENGIRIMAN        int  comment '',
   WAKTU_PENGIRIMAN     varchar(20)  comment '',
   KETERANGAN_PENGIRIMAN varchar(50)  comment '',
   primary key (ID_STATUS)
);

alter table METODE_PEMBAYARAN__PAYMENT_METHOD_ add constraint FK_METODE_P_DIGUNAKAN_PRODUK__ foreign key (ID_PRODUK)
      references PRODUK__PRODUCT_ (ID_PRODUK) on delete restrict on update restrict;

alter table METODE_PEMBAYARAN__PAYMENT_METHOD_ add constraint FK_METODE_P_MENGGUNAK_PESANAN_ foreign key (ID_PESANAN)
      references PESANAN__ORDER_ (ID_PESANAN) on delete restrict on update restrict;

alter table PENGIRIMAN_SHIPMENT_ add constraint FK_PENGIRIM_MELAKUKAN_PENJUAL_ foreign key (ID_PENJUAL)
      references PENJUAL__SELLER_ (ID_PENJUAL) on delete restrict on update restrict;

alter table PENJUAL__SELLER_ add constraint FK_PENJUAL__DIJUAL_PRODUK__ foreign key (ID_PRODUK)
      references PRODUK__PRODUCT_ (ID_PRODUK) on delete restrict on update restrict;

alter table PESANAN__ORDER_ add constraint FK_PESANAN__MEMBUAT_PELANGGA foreign key (ID_PELANGGAN)
      references PELANGGAN__CUSTOMER_ (ID_PELANGGAN) on delete restrict on update restrict;

alter table STATUS_PENGIRIMAN__SHIPMENT_STATUS_ add constraint FK_STATUS_P_MEMILIKI_PENGIRIM foreign key (ID_PENGIRIMAN)
      references PENGIRIMAN_SHIPMENT_ (ID_PENGIRIMAN) on delete restrict on update restrict;

