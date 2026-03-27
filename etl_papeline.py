import pandas as pd
#import glob
from sqlalchemy import create_engine

# IMPORTANDO OS ARQUIVOS CSV

df_sleep = pd.read_csv("data/sleep_mobile_stress_dataset_15000.csv")

print(df_sleep)

# CRIANDO NOVO ARQUIVO CSV
"""
colunas = [
    'age',
    'gender',
    'occupation',
    'daily_screen_time_hours',
    'sleep_duration_hours',
    'stress_level',
    'caffeine_intake_cups'
]

sleep_df = df_sleep[colunas]

sleep_df.to_csv("data/datasleep.csv", index=False)

print("Arquivo criado com sucesso!")
"""

# CRIANDO A TABELA NO SQLITE
engine = create_engine("sqlite:///datasleep.db")

df = pd.read_csv("data/datasleep.csv")
print(df)