import numpy as np
import matplotlib.pyplot as plt
import os


def main():
    print("Hello World!")

    #######
    # p02 #
    #######

    x = np.linspace(0, 10, 100)
    y = np.sin(x)

    print(
        "\n"
        "-----\n"
        " p02 \n"
        "-----\n"
    )

    print(f"x:\n{x}\n\ny:\n{y}")

    plt.figure()
    plt.plot(x, y)


if __name__ == "__main__":
    main()
