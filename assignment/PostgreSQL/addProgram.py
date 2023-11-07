import psycopg2, getpass, pandas as pd
from psycopg2 import Error

def getAddProgramQuery():
    program_name = input('Enter program name: ')
    program_date = input('Enter program date (YYYY-MM-DD): ')
    target_audience_id = int(input('Enter target audience ID: '))
    return f"SELECT addProgram('{program_name}', '{program_date}', {target_audience_id})"

def excuteSQL(sql, cols, cursor, con):
    cursor.execute(sql)
    df = pd.DataFrame( cursor.fetchall(), columns=cols)
    print(df)
    con.commit()

try: 
    connection = psycopg2.connect(
        host="147.252.250.51",
        user="C21725659",
        password=getpass.getpass(prompt='Password '),
        port="54321",
        database="postgres")
    cursor = connection.cursor()

    program = excuteSQL(getAddProgramQuery(), ['Program ID'], cursor, connection)
    excuteSQL(program, ['Program ID'], cursor, connection)

except (Exception, Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    if (connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
    else:
        print("Terminating")

