# My init script

# NOTES:
#  * Before command has been tied to a keymap, Use control-shift-p to get to it

# tell_user: my equivalent of a simple dialog box
tellUser = (user_message) ->
  atom.confirm
    message: user_message
    buttons:
      OK:  =>

atom.commands.add 'atom-text-editor', 'custom:delete-tag', ->
  return unless editor = atom.workspace.getActiveTextEditor()
  # NOTE: If I start seeing weird behavior, may need to clear other cursors before running the   Next line
  editor.selectLinesContainingCursors()
  line =  editor.getLastSelection().getText()

  line = line.replace(/<([^>])+>/, '')
  # line = line.replace(/^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$/, "$2")
  # line = line.replace(/<\/p>/, ' Puppy')
  # line = line.replace(/a$/, ' Puppy')
  # line = line.replace(/<\/p>\n$/, ' Puppy')
  # tellUser strawberry

  editor.insertText("#{line}")   # NOTE: calling insertText is the right way to go: that's how their example does it
  # What I need to do is grab the cursor position before I do the Insert,
  # and then restore it afterwards -- I think that'll do the trick

 # <p>  this is some text </p>
 # This is the next Line




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
