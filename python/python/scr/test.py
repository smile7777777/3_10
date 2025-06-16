import matplotlib.pyplot as plt

# Data
x_values = [0.0001, 0.0002, 0.0004, 0.0008, 0.0016, 0.0032, 0.0064, 0.0128, 0.0256, 0.032, 0.0389, 0.0512, 0.1024]
y_values = [7.46667, 7.3, 7.58, 7.75, 7.78346, 8.85106, 10.4972, 13.8051, 33.5246, 216.098, 700.995, 1699.76, 3536]

plt.figure(figsize=(10, 6))
plt.plot(x_values, y_values, marker='o', linestyle='-', color='b', label='Data')

plt.xscale('log')

plt.xlabel('X Values (log scale)')
plt.ylabel('Y Values')
plt.title('Plot of Data Points with Logarithmic X-Axis')
plt.legend()
plt.grid(True, which="both", linestyle='--', linewidth=0.5)

plt.show()
