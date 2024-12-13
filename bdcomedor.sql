CREATE TABLE "producto" (
  "id_producto" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nombre" varchar NOT NULL,
  "precio" decimal
);

CREATE TABLE "ingredientes" (
  "id_ingrediente" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nombre" varchar NOT NULL
);

CREATE TABLE "producto_ingrediente" (
  "id_proingr" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id_ingrediente" integer,
  "id_producto" integer
);

CREATE TABLE "nota_venta" (
  "id_nota" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "total" decimal NOT NULL,
  "nombre" varchar NOT NULL DEFAULT 'cliente',
  "fecha" date NOT NULL,
  "estado_pago" varchar NOT NULL
);

CREATE TABLE "detalle" (
  "id_detalle" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "cantidad" integer NOT NULL,
  "sub_total" decimal NOT NULL,
  "nota" varchar,
  "id_nota" integer,
  "id_producto" integer
);

CREATE TABLE "reporte" (
  "id_reporte" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "fecha_apertura" timestamp NOT NULL,
  "fecha_cierre" timestamp NOT NULL,
  "total" decimal
);

CREATE TABLE "detalle_ventas" (
  "id_detalle" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nota_venta" integer,
  "reporte" integer
);

ALTER TABLE "producto_ingrediente" ADD FOREIGN KEY ("id_ingrediente") REFERENCES "ingredientes" ("id_ingrediente");

ALTER TABLE "producto_ingrediente" ADD FOREIGN KEY ("id_producto") REFERENCES "producto" ("id_producto");

ALTER TABLE "detalle" ADD FOREIGN KEY ("id_nota") REFERENCES "nota_venta" ("id_nota");

ALTER TABLE "detalle" ADD FOREIGN KEY ("id_producto") REFERENCES "producto" ("id_producto");

ALTER TABLE "detalle_ventas" ADD FOREIGN KEY ("nota_venta") REFERENCES "nota_venta" ("id_nota");

ALTER TABLE "detalle_ventas" ADD FOREIGN KEY ("reporte") REFERENCES "reporte" ("id_reporte");

ALTER TABLE "detalle_ventas" ADD FOREIGN KEY ("nota_venta") REFERENCES "nota_venta" ("id_nota");

ALTER TABLE "detalle_ventas" ADD FOREIGN KEY ("reporte") REFERENCES "reporte" ("id_reporte");
