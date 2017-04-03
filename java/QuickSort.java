/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author koush
 */
public class QuickSort {

    /**
     * @param args the command line arguments
     */
    static int[] uno = {9,2,3,90,1,1,3,4,8};

    public static void main(String[] args) {
        QuickSort(0, uno.length - 1);
//        for (int i = 0; i < uno.length-1; i++) {
//            System.out.print(uno[i]+",");
//        }
    }

    // Performing Quick Sort
    /*
        Quick Sort is a genereic fast algorithm to sort . 
        Avg. Running time for quick sort is O(nlogn)
     */
    
    /*
         If you want to code it into assembly, This is just a loop.
    */
    public static void QuickSort(int lower, int pivot) {
        if (lower < pivot) {
            int wall = Partition(lower, pivot);
            QuickSort(lower, wall - 1);
            QuickSort(wall + 1, pivot);
        }
        
    }

    public static int Partition(int lower, int pivot) {
        int key = uno[pivot];
        /*
        We need an pointer p which actually points that after this point all the value up until j 
        are all greater than pivot. 
        So we can specifically divide the array and tell that left array has all the key lower than right side . Comparing to the pivot . 
        As we also know that the next one (p +1) will hold the bigger value than pivot . 
        SO we will swap . 
         */
        int p = lower - 1;
        int swap_var ;
        for (int j = lower; j <pivot; j++) {
            if (uno[j] <= key) {
                p += 1;
                swap_var = uno[p];
                uno[p] = uno[j];
                uno[j] = swap_var;
                //System.out.println("Swapping value "+uno[j]+" With " +uno[p]);
            }
        }
        /*
        Now we will also swap the pivot with next element of p(We know greater)
         */
        swap_var = uno[p + 1];
        uno[p + 1] = key;
        uno[pivot] = swap_var;
        System.out.print("So, The array is ");
         for (int i = 0; i < uno.length-1; i++) {
            System.out.print(uno[i]+",");
        }
         System.out.println("");
        return p + 1;
    }

}
