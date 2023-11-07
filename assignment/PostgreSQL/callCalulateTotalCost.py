import psycopg2, getpass, pandas as pd
from psycopg2 import Error

def getCalculateTotalCostQuery():
    ad_id = int(input('Enter ad ID: '))
    start_date = input('Enter start date (YYYY-MM-DD): ')
    number_of_runs = int(input('Enter number of runs: '))
    region_id = int(input('Enter region ID: ')) 
    return f"SELECT calculateTotalCost({ad_id}, '{start_date}', {number_of_runs}, {region_id})"

def executeSQL(sql, cols, cursor, con):
    cursor.execute(sql)
    df = pd.DataFrame( cursor.fetchall(), columns=cols)
    print(df)
    con.commit()

try:
    connection = psycopg2.connect(
        host="localhost",  
        user = "postgres",
        password=getpass.getpass(prompt='Password '),
        port="54321", 
        database="postgres")
    cursor = connection.cursor()

    cost = executeSQL(getCalculateTotalCostQuery(), ['Total Cost'], cursor, connection)
    executeSQL(cost, ['Total Cost'], cursor, connection)

except (Exception, Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    if (connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
    else:
        print("Terminating")
