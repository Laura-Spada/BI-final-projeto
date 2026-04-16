-- =========================================
-- CRIAÇÃO DO SCHEMA (opcional)
-- =========================================
CREATE SCHEMA IF NOT EXISTS sleep_dw;

-- =========================================
-- DIM_USER
-- =========================================
CREATE TABLE dim_user (
    id_user SERIAL PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    occupation VARCHAR(100),
    stress_level INT
);

-- =========================================
-- DIM_SCREEN
-- =========================================
CREATE TABLE dim_screen (
    id_screen SERIAL PRIMARY KEY,
    daily_screen_time_hours NUMERIC(5,2),
    notifications_received_per_day INT
);

-- =========================================
-- DIM_CAFFEINE
-- =========================================
CREATE TABLE dim_caffeine (
    id_caffeine SERIAL PRIMARY KEY,
    caffeine_intake_cups INT
);

-- =========================================
-- DIM_PHYSICAL_ACTIVITY
-- =========================================
CREATE TABLE dim_physical_activity (
    id_physical_activity SERIAL PRIMARY KEY,
    physical_activity_minutes INT
);

-- =========================================
-- FATO_SLEEP
-- =========================================
CREATE TABLE fato_sleep (
    id_fato SERIAL PRIMARY KEY,

    id_user INT,
    id_screen INT,
    id_caffeine INT,
    id_physical_activity INT,

    sleep_quality_score NUMERIC(3,1),
    sleep_duration_hours NUMERIC(4,2),

    -- FOREIGN KEYS
    CONSTRAINT fk_user FOREIGN KEY (id_user)
        REFERENCES dim_user(id_user),

    CONSTRAINT fk_screen FOREIGN KEY (id_screen)
        REFERENCES dim_screen(id_screen),

    CONSTRAINT fk_caffeine FOREIGN KEY (id_caffeine)
        REFERENCES dim_caffeine(id_caffeine),

    CONSTRAINT fk_physical_activity FOREIGN KEY (id_physical_activity)
        REFERENCES dim_physical_activity(id_physical_activity)
);