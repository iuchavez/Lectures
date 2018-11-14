#include<stdio.h>
#include<stdlib.h>
#include<math.h>

// Defines the structure of a block of memory
struct Block
{
	int block_size;
	struct Block* next_block;
};

// A constant containing the offset needed to access data in a block
const int OVERHEAD_SIZE = sizeof(struct Block);
const int VOID_PSIZE = sizeof(void*);

// Head of the free list
struct Block *free_head;

void my_initialize_heap(int size){
	free_head = (struct Block*)malloc(size);
	free_head->block_size = (size - OVERHEAD_SIZE);
	free_head->next_block = NULL;
	// printf("%d\n", 100 - OVERHEAD_SIZE);
}

void* my_alloc(int size){
	size = (size < 8)? 8: size;
	size += OVERHEAD_SIZE - (size%8);


	struct Block *prev_block = NULL;
	// Walking the Linked List
	for (struct Block *current_block = free_head; 
		current_block != NULL; 
		current_block = current_block->next_block)
	{
		if (size <= current_block->size) // If it fits!
		{
			if(size == current_block->size && current_block == free_head){
				free_head = current_block->next_block;
				return ((char *)current_block + OVERHEAD_SIZE);
			} else if (size == current_block->size && current_block != free_head) { // Perfect fit but not the free head 
				prev_block->next_block = current_block.next_block;
				current_block->next_block = NULL;
				return ((char *)current_block + OVERHEAD_SIZE);
			}  
			 

			if (size < (current_block->size -(OVERHEAD_SIZE + VOID_PSIZE))){ // If splittable

				if (current_block == free_head) {

				}
				else {

				}
			} else {  // Not splitable either because it fits perfectly or leaves not room for new block overhead + 8 bytes
				// fits but not enough room to split
				if (current_block == free_head) {

				}
				else {

				}
			}
		}
		prev_block = current_block;
	}

	// printf("%d\n", rounded_size);
	// rounded_size = (size%pointer_size == 0 && size == pointer_size) 
}

double round_up(double value, double base){
	if(value == base){
		return value;
	} else if(value < base){
		return base;
	} else if(value > base){
		return ceil(base/value);
	}
}

int main(int argc, char const *argv[])
{

	printf("%d\n", VOID_PSIZE);
	// // printf("%d\n", OVERHEAD_SIZE);
	// my_initialize_heap(100);
	// // printf("%d\n", free_head->block_size);
	// my_alloc(2);
	// printf("%f\n", round_up(16.0,4.0));
	return 0;
}