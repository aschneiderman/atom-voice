# My init script

# -----------------------------------------------------------------------------
# Helper functions

# tellUser: my equivalent of a simple dialog box
tellUser = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>

fixCurrentLine = (fixingFunction)  ->
  # fixCurrentLine: runs fixingFunction on the current line and replaces the current line with the result
  return unless editor = atom.workspace.getActiveTextEditor()
  myCursor = editor.getCursorBufferPosition()
  editor.selectLinesContainingCursors()    # NOTE: Will do weird things if you have multiple cursors active
  line =  editor.getLastSelection().getText()
  editor.insertText("#{fixingFunction(line)}")
  editor.setCursorBufferPosition(myCursor)


# -----------------------------------------------------------------------------
# My commands

atom.commands.add 'atom-text-editor', 'voice:delete-tag', ->
# delete-tag: Deletes the outer tags -- e.g., <p>...</p> -- the current line
  fixCurrentLine ( (line) ->
    line.replace(/<([^>]+)>(.*)<\/\1>\s*\n$/, "$2\n" )
  )

#      <p> To test delete-tag, run it on this line</p>


atom.commands.add 'atom-text-editor', 'd3s:preformat-code', ->
# preformat-code: Convert the D3 code stored in the clipboard into preformatted HTML and insert it
  return unless editor = atom.workspace.getActiveTextEditor()
  text = atom.clipboard.read()
  text = text.replace(/>/, '&lt')
  tellUser "The preformatted code is: (#{text})"
  # selection.insertText("[#{selection.getText()}](#{clipboardText})")



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
