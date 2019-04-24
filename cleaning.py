import pandas as pd
import xlrd

cio = xlrd.open_workbook('./data/CIO Raw Data v3.xlsx')
def create_averages_df(end_year):
    global cio
    df = pd.DataFrame()
    for year in range(2001, (end_year)):
        page = cio.sheet_by_name(str(year))
        titles = page.row_values(59, start_colx=2, end_colx=18)
        titles.append("Year")
        for info in range(60, 65):
            totals = {}
            vals = page.row_values(info, start_colx=2, end_colx=18)
            vals.append(year)
            pairs = zip(titles, vals)
            for key,val in pairs:
                totals[key.strip()] = val
            df = df.append(totals, ignore_index=True)
    df.to_csv('./data/Cleaned_ACCUMULATIVE_CIO_Data_For_Database.csv', index=False)

# def create_each_df():
#     global cio
#     df = pd.DataFrame()
#     for year in range(2001, 2017):
#         page = cio.sheet_by_name(str(year))
#         titles = page.row_values(59, start_colx=2, end_colx=16)
#         titles.append("Year")
#         for info in range(60, 65):
#             totals = {}
#             vals = page.row_values(info, start_colx=2, end_colx=16)
#             vals.append(year)
#             pairs = zip(titles, vals)
#             for key,val in pairs:
#                 totals[key.strip()] = val
#             df = df.append(totals, ignore_index=True)
#     df.to_csv('Cleaned_ACCUMULATIVE_CIO_Data_For_Database.csv', index=False)    

if __name__ == '__main__':
    end = input('Please enter the last year of the dataset as long as the column schema matches the previous sheets:\n')
    create_averages_df(int(end))
    # create_each_df()