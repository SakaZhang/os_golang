; bootloader会跳转到下面的地址读取rt0_32开始运行主函数
LOAD_ADDRESS equ 0x100000

; 页偏移量从上半48位内存区域开始使用，而且从上面的地址开始读取
PAGE_OFFSET equ 0xffff800000000000
