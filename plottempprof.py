import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("profiledata.out", skiprows=2, sep='\s+', header= None, engine='python')
df.columns = ["r", "T"]
# print(df)

plt.plot(df['r'], df['T'])
plt.xlabel("Radius (AU)")
plt.ylabel("Temperature (K)")
plt.show()