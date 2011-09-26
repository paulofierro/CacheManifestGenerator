# Set the local path to loop through
# Do not end with a slash. Relative paths are fine
PATH = "/Users/paulo/dev/myApp"

# Set the file types to look for
FILE_TYPES = "css,jpg,png,html,js,svg,ttf,woff"

IGNORE_FILES = ["fileToIgnore.png"]

# Set the name of the created file
OUTPUT = "offline.appcache"

# Get an array of the files
files = Dir.glob(PATH + "/**/*.{" + FILE_TYPES + "}")

# Check if we have any files
if files.length == 0
   puts "No files found." 
   Process.exit
else
    puts files.length.to_s + " files found."
end

# Start the cache manifest
contents = "CACHE MANIFEST\n"
contents += "# Generated at " + Time.now.to_s + "\n\n"
contents += "CACHE:\n"

# Loop through the files
files.each do |file|
	filename = file.sub(PATH, "")
	unless IGNORE_FILES.include?(filename)
		contents += filename + "\n"
	end
end

# Add the FALLBACK
contents += "\nFALLBACK:\n"
contents += "# For example:\n"
contents += "# / /offline.html\n"

# Add the NETWORK
contents += "\nNETWORK:\n"
contents += "*\n"

# Write it out to disk
File.open(OUTPUT, "w") {|f| f.write(contents) }

# Show a message to the user
puts "Cache-manifest '" + OUTPUT + "' was created successfully."