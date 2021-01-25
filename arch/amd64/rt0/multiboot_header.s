section .multiboot_header

MAGIC equ 0xe85250d6
ARCH equ 0x0    

header_start:
	dd MAGIC                       
	dd ARCH                        
	dd header_end - header_start   

	dd (1 << 32) - (MAGIC + ARCH + (header_end - header_start))

        ; Console flags tag
	align 8 ; tags should be 64-bit aligned
	dw 4    ; type
	dw 0    ; flags
	dd 12   ; size 
	dd 0x3  ; kernel supports EGA console
	
	; Define graphics mode tag to advise the bootloader that the kernel
	; supports framebuffer console. Ssetting 0 for width, height and bpp
	; indicates no particular mode preference.
	align 8 ; tags should be 64-bit aligned
	dw 5    ; type
	dw 0    ; flags
	dd 20   ; size 
	dd 0    ; width (pixels or chars)
	dd 0    ; height (pixels or chars)
	dd 0    ; bpp (0 for text mode)
	
	; According to page 6 of the spec, the tag list is terminated by a tag with 
	; type 0 and size 8
	align 8 ; tags should be 64-bit aligned
	dd 0    ; type & flag = 0
	dd 8    ; size
header_end:
