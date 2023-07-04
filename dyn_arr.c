#include <stdio.h>
#include <stdlib.h>

struct Node {
  int val;
  struct Node *next;
};

struct Node *head = NULL;
struct Node *last = NULL;

int add_first(int v) {
  struct Node *p = (struct Node *)malloc(sizeof(struct Node));
  p->val = v;
  p->next = NULL;

  head = p;
  last = p;
}

int add(int v) {

  struct Node *p = (struct Node *)malloc(sizeof(struct Node));
  p->val = v;
  p->next = NULL;

  last->next = p;
  last = p;
}

int print_all() {
  struct Node *cur;
  cur = head;

  while (1) {

    if (cur == NULL) {
      break;
    }

    printf("%d\n", cur->val);

    cur = cur->next;
  }
}

int main() {

  add_first(4342);
  add(23323);
  add(234324);
  add(342);

  print_all();

  return 0;
}
