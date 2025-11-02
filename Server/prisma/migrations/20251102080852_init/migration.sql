-- CreateTable
CREATE TABLE "residents" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "residents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "visitors" (
    "id" SERIAL NOT NULL,
    "visitor_name" VARCHAR(100) NOT NULL,
    "visitor_email" VARCHAR(100) NOT NULL,
    "resident_name" VARCHAR(100) NOT NULL,
    "resident_email" VARCHAR(100) NOT NULL,
    "visit_reason" TEXT NOT NULL,
    "car_number" VARCHAR(20),
    "verification_code" VARCHAR(4),
    "status" VARCHAR(20) NOT NULL DEFAULT 'pending',
    "in_date" DATE,
    "in_time" TIME(6),
    "out_date" DATE,
    "out_time" TIME(6),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "visitors_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "residents_email_key" ON "residents"("email");

-- AddForeignKey
ALTER TABLE "visitors" ADD CONSTRAINT "visitors_resident_email_fkey" FOREIGN KEY ("resident_email") REFERENCES "residents"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
