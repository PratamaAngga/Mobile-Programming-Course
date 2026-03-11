# Discount Calculator System

This program code is a discount calculator with the output given being the discount category and the final total after the initial price is reduced by the discount.

My NIM, especially the last three digits, affects the discount calculation. There are two ways my NIM affects the total purchase:

1. Directly affects the total value
   nilaiUnikNIM = 113.0 is added as the 6th element to the price list. This means it's included in hitungTotal(), so each student's initial total will be different depending on the last three digits of their NIM.

2. Potentially shifts the discount category
   For example, if the total price of 5 items is 99,950, without a NIM, you don't get a discount. However, if the last three digits of the NIM are 51 or higher, the total becomes 100,001 and immediately falls into the 5% discount category. So, the NIM can be the "determinant" of whether someone gets a discount or not!

## Authors

- [@PratamaAngga](https://github.com/PratamaAngga) Pratama Angga Saputra / SIB 2 G / 244107060113

## Documentation - Result/Output Discount Calculator System

![Output](http://github.com/PratamaAngga/Tugas-Jobhseet-3/blob/main/Docs/Output%201.jpg)
