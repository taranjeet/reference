A list of Sublime useful shortcuts and tips

* <kbd>ctrl</kbd> + 0 : switch to side pane, Esc to back to normal
* __Cursor Movement__
    * <kbd>Fn</kbd> + <kbd>End</kbd> : End of Line
    * <kbd>Fn</kbd> + <kbd>Home</kbd> : Start of Line
    * <kbd>Ctrl</kbd> + <kbd>Left/Right</kbd> : Selects one words left or right
    * <kbd>Ctrl</kbd> + M : Jump to matching bracket.
    * <kbd>Ctrl</kbd> + G : Go to any line within a file

* <kbd>Alt</kbd> + - : __Jumps__ back to the previous location. Useful when you need to go to a place to correct that and then jump back to the previous location.
* <kbd>Ctrl</kbd> + ? : Comments/Uncomments a line
* <kbd>Ctrl</kbd> + D : Mutiple Selection, <kbd>Ctrl</kbd> + K to skip current instance, <kbd>Ctrl</kbd> + U to unselect current instance
* <kbd>Ctrl</kbd> + L : expands the Selection into line, with <kbd>Shift</kbd> splits the selection into lines
* <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + Up/Down : Moves current line or a selected block up or down
* <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + M :  expands selection to brackets
* <kbd>Ctrl</kbd> + P: __Opens GoTo Anything__.
    * Search or browse through any file which is there in the opened projects list.
    * To search at a particular line no use __:__.

      Eg: line no 100 in models.py with  ```models.py:100```

    * For a paritcular keyword use __@__
      Eg: word requests in views.py with
      ```views.py @requests```
    * In a Html file, to naivgate to any class, just type __#__ and then a list of all tags, classes will appear.

* <kbd>Ctrl</kbd> + <kbd>[</kbd> or <kbd>]</kbd> : Indent / Unindent the current line or selection
* <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + K : Delete or entire line or Cut that line

* <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + P : Open command Palette
* <kbd>Ctrl</kbd> + ` : opens up a python interpreter(Python 3.3)
* <kbd>Ctrl</kbd> +  Enter : Search multiline text
* <kbd>Ctrl</kbd> + T : Transpose things
* Macros :  Sequence of command that you can record and repeat
    * <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + Q : Start/stop recording (goes in buffer)
    * <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> + Q : Repeat the recorded macro

Tips :
* A quick way to switch to any open file is <kbd>Ctrl</kbd> + <kbd>P</kbd>, then select the file by Arrow Key or type its name and <kbd>Enter</kbd>.
* To open any project in the same sublime window, cd to that directory and type
  ```subl . -a```
* Typing a program, need to build it. Use <kbd>Ctrl</kbd> + B (Can't take input).
* Use <kbd>Shift</kbd> + <kbd>F11</kbd> to switch to distraction free mode.
