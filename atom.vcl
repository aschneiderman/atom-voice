# Voice commands for atom


Find (File | Document) = {Ctrl+t};
Save As = {Ctrl+Shift+s};
Save and Reload =  {Ctrl+s}  Wait(100) {Alt+Tab} Wait(300);






# --- Navigation commands ------------------------------------
Line 1..200 = {Ctrl+g} $1 {Enter};
(Left = 'b' | Right = 'f') Word = {Alt+$1};
Top = {Ctrl+Home};
Bottom = {Ctrl+End};

Find Symbol = {Ctrl+r};

(Set | Add | Clear | Hide | Delete) Bookmark = {Ctrl+Alt+F2};
(Next = 'F2' | Last = 'Shift+F2') Bookmark = {$1};

Next Window = {Ctrl+Tab};
Last Window = {Ctrl+Shift+Tab};


# --- Editing commands ----------------------------------------
Select (Next = 'Down' | Last = 'Up') 1..20 Lines = {Home} {Shift+$1_$2};
Join That = {Ctrl+j};
Move Line (Up | Down) 1..20  = {Ctrl+$1_$2};
Dede = {Ctrl+Shift+k};
Delete 1..20 Lines = {Ctrl+Shift+k_$1};

# TO ADD:
# DELETE TWO WORDS
# delete between next tags




# --- Code commands -------------------------------------------
Start (para = 'p' | Item = 'li' | List = 'ul' | HTML = 'html'
	| Snippet = 'snip') = $1 {Tab};
Start (Header | Heading) 1..7 = h $2 {Tab}; 

# TO ADD:
# adding HTML comments, using a snippet

Shortcut Keys = {Ctrl+Shift+p};

