package Lab5;

import java.util.LinkedList;
import java.util.Random;

public class ListSorter {
	private LinkedList<Integer> list;

	public ListSorter(LinkedList<Integer> list) {
		this.list = list;
	}

	public void sortList() {
		quikSort(list, 0, list.size() - 1);
	}

	public void quikSort(LinkedList<Integer> list, int left, int right) {
		if (left >= right)
			return;

		int pivot = list.get((left + right) / 2);
		int index = partition(list, left, right, pivot);
		quikSort(list, left, index - 1);
		quikSort(list, index, right);
	}

	private int partition(LinkedList<Integer> list, int left, int right, int pivot) {

		int l = left;
		int r = right;

		while (l <= r) {
			while (list.get(l) < pivot)
				l++;
			while (list.get(r) > pivot)
				r--;

			if (l <= r) {
				swap(list, l, r);
				l++;
				r--;
			}
		}
		return l;
	}

	private void swap(LinkedList<Integer> list, int left, int right) {
		int temp = list.get(left);
		list.set(left, list.get(right));
		list.set(right, temp);
	}
	/*
	public static void main(String[] args) {
		
		LinkedList<Integer> l = new LinkedList<>();
		l.add(5);
		l.add(20);
		l.add(7);
		l.add(9);
		l.add(3);
		l.add(4);
		
		ListSorter ls = new ListSorter(l);
		System.out.println(l);
		ls.sortList();
		System.out.println(l);
		
	}
	*/

}
