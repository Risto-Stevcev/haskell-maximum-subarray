import matplotlib.pyplot as plt
import sys


def plot_graph(array, max_subarray):
    sublen = len(max_subarray)
    plots = area = area_axis = []
    in_sub = 0

    for i, item in enumerate(array):
        plots.append((i,item))

        if in_sub == 0 and item == max_subarray[0] and array[i:i+sublen] == max_subarray:
            area_axis = list(reversed(zip(range(i,i+sublen), [0]*sublen)))
            in_sub = i

    area = plots[in_sub:in_sub+sublen] + area_axis

    plt.plot(array)
    plt.plot([0]*len(array))
    plt.scatter(*zip(*plots))
    plt.fill(*zip(*area))
    plt.xlabel('index')
    plt.ylabel('value')
    plt.show()


if __name__ == '__main__':
    if len(sys.argv) == 3:
        array = [int(i) for i in sys.argv[1].split(',')]
        max_subarray = [int(i) for i in sys.argv[2].split(',')]
        plot_graph(array, max_subarray)
    else:
        print('Usage: %s [array] [max subarray]' % sys.argv[0])
        print("Ex: %s '13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7' '18,20,-7,12'" % sys.argv[0])     
