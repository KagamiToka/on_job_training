package com.mycompany.array;

import java.util.Arrays;
import java.util.Scanner;


public class ArrayDSA {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter length of array: ");
        int n = Integer.parseInt(sc.nextLine());
        int[] array = new int[n];
        
        
        for (int i = 0; i < n; i++) {
            System.out.print("Enter number at index " + (i+1) + ": ");
            array[i] = Integer.parseInt(sc.nextLine());
        }
        System.out.println("The begining array" + Arrays.toString(array));
        
        moveZeroToEnd(n, array);
        moveZeroToBegin(array);
    }
    
    private static void moveZeroToEnd(int n, int[] array) {
        int index = 0;
        //Cách 1: copy non-zero rồi điền vào cuối
//        for (int i = 0; i < array.length; i++) {
//            if (array[i] != 0) {
//                array[index++] = array[i];
//            }
//        }
//        
//        while(index < n) {
//            array[index++] = 0;
//        }
//        
        //Cách 2: swap khi gặp phần tử khác 0 cho index
        for (int i = 0; i < array.length; i++) {
            if (array[i] != 0) {
                int temp = array[i];
                array[i] = array[index];
                array[index] = temp;
                index++;
            }
        }
        
        System.out.println("The array after move 0 to the end: " +  Arrays.toString(array));
    }
    
    private static void moveZeroToBegin(int[] array) {
        int index = array.length -1;
        //Cách 1: copy nonzero , điền 0 vào trước 
        for (int i = array.length - 1; i >= 0; i--) {
            if (array[i] != 0) {
                array[index--] = array[i];
            }
        }
        
        while(index >= 0) {
            array[index--] = 0;
        }
        
        System.out.println("The array after move 0 to the begin: " +  Arrays.toString(array));
    }
    
    private static void goalSum(int[] array) {
        
    }
}
