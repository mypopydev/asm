aligned: aligned.o
	gcc -o aligned aligned.o -no-pie
aligned.o: aligned.asm
	nasm -f elf64 -g -F dwarf aligned.asm -l aligned.lst
clean:
	rm -rf aligned aligned.o aligned.lst
