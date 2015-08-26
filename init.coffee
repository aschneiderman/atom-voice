# My init script

# NOTES:
#  * Before command has been tied to a keymap, Use control-shift-p to get to it

# tell_user: my equivalent of a simple dialog box
tellUser = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>

atom.commands.add 'atom-text-editor', 'voice:delete-tag', ->
  # delete-tag: Deletes the outer tags -- e.g., <p>...</p>
  return unless editor = atom.workspace.getActiveTextEditor()
  editor.selectLinesContainingCursors()    # NOTE: If I get weird behavior, may need to clear other cursors before running the   Next line
  line =  editor.getLastSelection().getText()
  line = line.replace(/<([^>]+)>(.*)<\/\1>\s*\n$/, "$2\n" )
  editor.insertText("#{line}")




# ---------------------------------------------------------------------------------------
  # SOME USEFUL TRICKS:
  # blueberry = editor.getCursorBufferPosition()    # This line works!
  # editor.insertText("here are some great strawberries: #{blueberry}")



# Up next: add snippets to make commands easier to create (and document in this and key map file)
#          Figure out how to create a cut to bookmark command


# ---------------------------------------------------------------------------------------
# commands and other stuff I might want to try out

# Example script: creating a markdown link using what you have selected and what you last copied
atom.commands.add 'atom-text-editor', 'markdown:paste-as-link-anders', ->
  return unless editor = atom.workspace.getActiveTextEditor()
  selection = editor.getLastSelection()
  clipboardText = atom.clipboard.read()
  selection.insertText("[#{selection.getText()}](#{clipboardText})")

# Example: log to the console when each text editor is saved.
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
