void update() {
  if (loadStrings("https://www.github.com")!=null) {
    String[] files=loadStrings("https://raw.githubusercontent.com/yzabeast1/combined-games/main/files.txt");
    String[] images=loadStrings("https://raw.githubusercontent.com/yzabeast1/combined-games/main/images.txt");
    if (files!=null)for (int i=0; i<files.length; i++)saveStrings(files[i], loadStrings("https://raw.githubusercontent.com/yzabeast1/combined-games/main/"+files[i]));
    if (images!=null)for (int i=0; i<images.length; i++)loadImage("https://github.com/yzabeast1/combined-games/blob/main/"+images[i]+"?raw=true").save(images[i]);
    exit();
  }
}
