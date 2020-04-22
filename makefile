RM = rm -f $(DEPDIR)/*.d $(OBJDIR)/*.o *~ $(OUTPUT) 

DEPDIR := dep
OBJDIR := obj
OUTDIR := $(CIBLE)#out
OUTPUT := $(OUTDIR)/helloworld.exe

#LOCAL_SRC_DIRS := .
LOCAL_SRC_DIRS += tools


#LOCAL_INC_DIRS := .
LOCAL_INC_DIRS += inc

SRC := $(foreach sdir,$(LOCAL_SRC_DIRS),$(wildcard $(sdir)/*.c))
INC := $(foreach idir,$(LOCAL_INC_DIRS),-I$(idir))
OBJ := $(addprefix $(OBJDIR)/,$(notdir $(SRC:.c=.o)))
DEP := $(addprefix $(DEPDIR)/,$(notdir $(OBJ:.o=.d)))

VPATH = $(LOCAL_SRC_DIRS)

ifneq "$(findstring clean,$(MAKECMDGOALS))" "clean"
-include $(DEP)
endif

.PHONY: all clean dirtree
.DEFAULT_GOAL := all

all: $(LIBRARIE) $(OUTPUT)

$(OUTPUT): $(OBJ)
	$(CC) main.c -o $(OUTPUT) $(OBJDIR)/*.o $(CFLAGS) $(INC)

$(DEPDIR)/%.d: %.c
	$(CC) -MM -MF $@ -MP -MT "$(OBJDIR)/$*.o $@" $(CFLAGS) $(INC) $<

$(OBJDIR)/%.o: %.c
	$(CC) -fPIC $(CFLAGS) $(INC) -c -o $@ $<

$(OBJ) $(DEP): | dirtree

dirtree:
	mkdir -p $(DEPDIR) $(OBJDIR) $(OUTDIR)

clean:
	$(RM)
