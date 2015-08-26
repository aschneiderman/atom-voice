# My init script

# -----------------------------------------------------------------------------
# Helper functions

# tellUser: my equivalent of a simple dialog box
tellUser = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>


# -----------------------------------------------------------------------------
# My commands

atom.commands.add 'atom-text-editor', 'voice:delete-tag', ->
# delete-tag: Deletes the outer tags -- e.g., <p>...</p>
  return unless editor = atom.workspace.getActiveTextEditor()
  myCursor = editor.getCursorBufferPosition()
  editor.selectLinesContainingCursors()    # NOTE: Will do weird things if you have multiple cursors active
  line =  editor.getLastSelection().getText()
  line = line.replace(/<([^>]+)>(.*)<\/\1>\s*\n$/, "$2\n" )
  editor.insertText("#{line}")
  editor.setCursorBufferPosition(myCursor)





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
