package modification;

import haven.CheckListboxItem;
import haven.Config;
import haven.Coord;
import haven.Coord2d;
import haven.Gob;
import haven.MainFrame;
import haven.OCache;
import haven.PUtils;
import haven.Resource;
import haven.Session;
import haven.Tex;
import haven.TexI;
import haven.Utils;
import haven.Widget;
import haven.sloth.gfx.SnowFall;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.imageio.ImageIO;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Toolkit;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Function;

public class configuration {
    public static String modificationPath = "modification";
    public static String soundPath = modificationPath + "/sound";
    public static String picturePath = modificationPath + "/picture";
    public static String errorPath = "errors";
    public static String pbotErrorPath = "pboterrors";

    public static boolean customTitleBoolean = Utils.getprefb("custom-title-bol", false);

    public static String defaultCustomTitleName(String name) {
        return "♂" + name + "♂: ♂right version♂";
    }

    public static String defaultTitle = MainFrame.TITLE;
    public static String defaultCustomTitle = "https://youtu.be/dQw4w9WgXcQ";
    public static String defaultUtilsCustomTitle = Utils.getpref("custom-title", defaultCustomTitle);

    public static String tittleCheck(Session sess) {
        String name, title;

        if (sess == null)
            name = "";
        else
            name = sess.username + " \u2013 ";

        if (configuration.customTitleBoolean)
            title = configuration.defaultUtilsCustomTitle;
        else
            title = defaultTitle;

        return name + title;
    }

    public static Coord savedHavenPanelSize = Utils.getprefc("havpansz", new Coord(800, 600));

    public static boolean autoclick = Utils.getprefb("autoclick", false);

    public static boolean statustooltip = Utils.getprefb("statustooltip", false);

    public static boolean newCropStageOverlay = Utils.getprefb("newCropStageOverlay", false);

    public static boolean newQuickSlotWdg = Utils.getprefb("newQuickSlotWdg", false);
    public static boolean newgildingwindow = Utils.getprefb("newgildingwindow", true);

    public static boolean scaletree = Utils.getprefb("scaletree", false);
    public static int scaletreeint = Utils.getprefi("scaletreeint", 25);

    public static boolean instflmopening = Utils.getprefb("instflmopening", true);
    public static boolean instflmchosen = Utils.getprefb("instflmchosen", false);
    public static boolean instflmcancel = Utils.getprefb("instflmcancel", true);

    public static boolean proximityspecial = Utils.getprefb("proximityspecial", false);
    public static boolean customquality = Utils.getprefb("customquality", false);
    public static String qualitypos = Utils.getpref("qualitypos", "Left-Bottom");
    public static boolean shownumeric = Utils.getprefb("shownumeric", true);
    public static String numericpos = Utils.getpref("numericpos", "Right-Top");
    public static boolean showstudytime = Utils.getprefb("showstudytime", true);
    public static String studytimepos = Utils.getpref("studytimepos", "Left-Top");

    public static Coord infopos(String pos, Coord parsz, Coord tsz) {
        switch (pos) {
            case "Right-Center":
                return new Coord(parsz.x - tsz.x, parsz.y / 2 - tsz.y / 2);
            case "Left-Center":
                return new Coord(0, parsz.y / 2 - tsz.y / 2);
            case "Top-Center":
                return new Coord(parsz.x / 2 - tsz.x / 2, 0);
            case "Bottom-Center":
                return new Coord(parsz.x / 2 - tsz.x / 2, parsz.y - tsz.y);
            case "Right-Top":
                return new Coord(parsz.x - tsz.x, 0);
            case "Right-Bottom":
                return new Coord(parsz.x - tsz.x, parsz.y - tsz.y);
            case "Center":
                return new Coord(parsz.x / 2 - tsz.x / 2, parsz.y / 2 - tsz.y / 2);
            case "Left-Bottom":
                return new Coord(0, parsz.y - tsz.y);
            case "Left-Top":
            default:
                return new Coord(0, 0);
        }
    }

    public static boolean showpolownersinfo = Utils.getprefb("showpolownersinfo", false);
    public static boolean oldmountbar = Utils.getprefb("oldmountbar", false);
    public static boolean newmountbar = Utils.getprefb("newmountbar", true);
    public static boolean showtroughstatus = Utils.getprefb("showtroughstatus", false);
    public static boolean showbeehivestatus = Utils.getprefb("showbeehivestatus", false);
    public static boolean showtreeberry = Utils.getprefb("showtreeberry", false);
    public static int showtreeberryamb = Utils.getprefi("showtreeberryamb", Color.WHITE.hashCode());
    public static int showtreeberrydif = Utils.getprefi("showtreeberrydif", Color.BLUE.hashCode());
    public static int showtreeberryspc = Utils.getprefi("showtreeberryspc", Color.RED.hashCode());
    public static int showtreeberryemi = Utils.getprefi("showtreeberryemi", Color.BLACK.hashCode());
    public static boolean morethanquility = Utils.getprefb("morethanquility", false);
    public static int morethancolor = Utils.getprefi("morethancolor", -1);
    public static int morethancoloroutline = Utils.getprefi("morethancoloroutline", Color.RED.hashCode());
    public static boolean showpointdist = Utils.getprefb("showpointdist", false);
    public static boolean straightridges = Utils.getprefb("straightridges", false);
    public static boolean gobspeedsprite = Utils.getprefb("gobspeedsprite", false);
    public static boolean kinid = Utils.getprefb("kinid", false);
    public static boolean forcelivestock = Utils.getprefb("forcelivestock", false);
    public static boolean forcelivestockopen = Utils.getprefb("forcelivestockopen", false);
    public static boolean resizableworld = Utils.getprefb("resizableworld", false);
    public static double worldsize = Utils.getprefd("worldsize", 1f);
    public static boolean rotateworld = Utils.getprefb("rotateworld", false);
    public static double rotateworldvalx = Utils.getprefd("rotateworldvalx", 0);
    public static double rotateworldvaly = Utils.getprefd("rotateworldvaly", 0);
    public static double rotateworldvalz = Utils.getprefd("rotateworldvalz", 0);
    public static boolean transparencyworld = Utils.getprefb("transparencyworld", false);
    public static boolean shieldnotify = Utils.getprefb("shieldnotify", false);

    public static boolean privatechatalerts = Utils.getprefb("privatechatalerts", true);
    public static boolean ignorepm = Utils.getprefb("ignorepm", false);
    public static boolean autoselectchat = Utils.getprefb("autoselectchat", true);

    public static List<String> liquids = new ArrayList<String>(Arrays.asList("Water", "Milk", "Aurochs Milk", "Cowsmilk", "Sheepsmilk", "Goatsmilk", "Piping Hot Tea", "Tea", "Applejuice", "Pearjuice", "Grapejuice", "Stale grapejuice", "Cider", "Perry", "Wine", "Beer", "Weißbier", "Mead", "Spring Water")) {{
        sort(String::compareTo);
    }};
    public static String autoDrinkLiquid = Utils.getpref("autoDrinkLiquid", "Water");
    public static boolean drinkorsip = Utils.getprefb("drinkorsip", false);
    public static boolean autodrinkosip = Utils.getprefb("autodrinkosip", false);
    public static int autosipthreshold = Utils.getprefi("autosipthreshold", 100);
    public static boolean autoDrinkWhatever = Utils.getprefb("autoDrinkWhatever", false);
    public static boolean siponce = Utils.getprefb("siponce", false);
    public static int sipwaiting = Utils.getprefi("sipwaiting", 2000);
    public static boolean drinkmessage = Utils.getprefb("drinkmessage", false);
    public static boolean autocleardamage = Utils.getprefb("autocleardamage", false);
    public static boolean showcombatborder = Utils.getprefb("showcombatborder", false);
    public static boolean showactioninfo = Utils.getprefb("showactioninfo", false);
    public static boolean showinvnumber = Utils.getprefb("showinvnumber", false);
    public static boolean moredetails = Utils.getprefb("moredetails", false);
    public static boolean showhiddenoverlay = Utils.getprefb("showhiddenoverlay", true);

    public static boolean scalingmarks = Utils.getprefb("scalingmarks", false);
    public static boolean bigmapshowgrid = Utils.getprefb("bigmapshowgrid", false);
    public static boolean bigmapshowviewdist = Utils.getprefb("bigmapshowviewdist", false);
    public static boolean bigmaphidemarks = Utils.getprefb("bigmapshowmarks", false);
    public static boolean allowtexturemap = Utils.getprefb("allowtexturemap", true);
    public static boolean allowoutlinemap = Utils.getprefb("allowoutlinemap", true);
    public static boolean allowridgesmap = Utils.getprefb("allowridgesmap", true);
    public static int mapoutlinetransparency = Utils.getprefi("mapoutlinetransparency", 255);
    public static float simplelmapintens = Utils.getpreff("simplelmapintens", 0.75f);
    public static boolean cavetileonmap = Utils.getprefb("cavetileonmap", false);
    public static boolean tempmarks = Utils.getprefb("tempmarks", false);
    public static boolean tempmarksall = Utils.getprefb("tempmarksall", false);
    public static int tempmarkstime = Utils.getprefi("tempmarkstime", 300);
    public static int tempmarksfrequency = Utils.getprefi("tempmarksfrequency", 500);

    public static float badcamdistdefault = Utils.getpreff("badcamdistdefault", 50.0f);
    public static float badcamdistminimaldefault = Utils.getpreff("badcamdistminimaldefault", 5.0f);
    public static float badcamelevdefault = Utils.getpreff("badcamelevdefault", (float) Math.PI / 4.0f);
    public static float badcamangldefault = Utils.getpreff("badcamangldefault", 0.0f);
    public static boolean badcamelevlock = Utils.getprefb("badcamelevlock", false);

    public static int pfcolor = Utils.getprefi("pfcolor", Color.MAGENTA.hashCode());
    public static int dowsecolor = Utils.getprefi("dowsecolor", Color.MAGENTA.hashCode());
    public static int questlinecolor = Utils.getprefi("questlinecolor", Color.MAGENTA.hashCode());
    public static int distanceviewcolor = Utils.getprefi("distanceviewcolor", new Color(10, 200, 200).hashCode());

    public static boolean nocursor = Utils.getprefb("nocursor", false);
    public static int crosterresid = Utils.getprefi("crosterresid", -1);

    public static String[] customMenuGrid = new String[]{Utils.getpref("customMenuGrid0", "6"), Utils.getpref("customMenuGrid1", "4")};

    public static Coord getMenuGrid() {
        return new Coord(Integer.parseInt(configuration.customMenuGrid[0]), Integer.parseInt(configuration.customMenuGrid[1]));
    }

    public static Coord getAutoSize(int w, int h) {
        Coord minSize = new Coord(800, 600);
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        Coord maxSize = new Coord(screenSize);
        Coord chosenSize = new Coord(w, h);

        if ((w < minSize.x && h > maxSize.y) || (w > maxSize.x && h < minSize.y) || (w < minSize.x && h < minSize.y)) {
            return minSize;
        }

        if (w < minSize.x) {
            chosenSize = new Coord(minSize.x, h * minSize.x / w);
            if (chosenSize.y < minSize.y) {
                chosenSize = new Coord(chosenSize.x * minSize.y / chosenSize.y, minSize.y);
                if (chosenSize.x > maxSize.x) {
                    chosenSize = new Coord(maxSize.x, chosenSize.y * maxSize.x / chosenSize.x);
                    if (chosenSize.y > maxSize.y)
                        chosenSize = new Coord(chosenSize.x * maxSize.y / chosenSize.y, maxSize.y);
                }
            }
        }
        if (h < minSize.y) {
            chosenSize = new Coord(w * minSize.y / h, minSize.y);
            if (chosenSize.x > maxSize.x) {
                chosenSize = new Coord(maxSize.x, chosenSize.y * maxSize.x / chosenSize.x);
                if (chosenSize.y > maxSize.y)
                    chosenSize = new Coord(chosenSize.x * maxSize.y / chosenSize.y, maxSize.y);
            }
        }
        if (w > maxSize.x) {
            chosenSize = new Coord(maxSize.x, h * maxSize.x / w);
            if (chosenSize.y > maxSize.y)
                chosenSize = new Coord(chosenSize.x * maxSize.y / chosenSize.y, maxSize.y);
        }
        if (h > maxSize.y)
            chosenSize = new Coord(w * maxSize.y / h, maxSize.y);

        return chosenSize;
    }

    public static BufferedImage scaleImage(BufferedImage before) {
        try {
            int w = before.getWidth();
            int h = before.getHeight();

            Coord chosenSize = new Coord(w, h);

            double scale1 = (double) chosenSize.x / w;
            double scale2 = (double) chosenSize.y / h;

            return scalingImage(before, chosenSize, scale1, scale2);
        } catch (Exception e) {
            e.printStackTrace();
            return before;
        }
    }

    public static BufferedImage scaleImage(BufferedImage before, Coord chosenSize) {
        try {
            int w = before.getWidth();
            int h = before.getHeight();

            double scale1 = (double) chosenSize.x / w;
            double scale2 = (double) chosenSize.y / h;

            return scalingImage(before, chosenSize, scale1, scale2);
        } catch (Exception e) {
            e.printStackTrace();
            return before;
        }
    }

    public static BufferedImage scaleImage(String name) throws Exception {
        File img = new File(name);
        BufferedImage in = ImageIO.read(img);

        return scaleImage(in);
    }

    public static BufferedImage scaleImage(String name, Coord chosenSize) throws Exception {
        File img = new File(name);
        BufferedImage in = ImageIO.read(img);

        return scaleImage(in, chosenSize);
    }

    public static BufferedImage scaleImage(BufferedImage before, boolean autoSize) {
        try {
            int w = before.getWidth();
            int h = before.getHeight();

            Coord chosenSize;
            if (autoSize) chosenSize = getAutoSize(w, h);
            else chosenSize = new Coord(w, h);

            // Create a new image of the proper size
            int w2 = chosenSize.x;
            int h2 = chosenSize.y;
            double scale1 = (double) w2 / w;
            double scale2 = (double) h2 / h;
            BufferedImage after = new BufferedImage(w2, h2, BufferedImage.TYPE_INT_ARGB);
            AffineTransform scaleInstance = AffineTransform.getScaleInstance(scale1, scale2);
            AffineTransformOp scaleOp = new AffineTransformOp(scaleInstance, AffineTransformOp.TYPE_BILINEAR);

            scaleOp.filter(before, after);
            return after;
        } catch (Exception e) {
            e.printStackTrace();
            return before;
        }
    }

    public static BufferedImage scaleImage(BufferedImage before, int scale) {
        try {
            int w = before.getWidth();
            int h = before.getHeight();
            // Create a new image of the proper size
            int w2 = (int) (w * scale);
            int h2 = (int) (h * scale);
            BufferedImage after = new BufferedImage(w2, h2, BufferedImage.TYPE_INT_ARGB);
            AffineTransform scaleInstance = AffineTransform.getScaleInstance(scale, scale);
            AffineTransformOp scaleOp = new AffineTransformOp(scaleInstance, AffineTransformOp.TYPE_BILINEAR);

            scaleOp.filter(before, after);
            return after;
        } catch (Exception e) {
            e.printStackTrace();
            return before;
        }
    }

    public static BufferedImage scaleImage(String name, BufferedImage defaultImage) {
        try {
            return scaleImage(name);
        } catch (Exception e) {
            e.printStackTrace();
            return defaultImage;
        }
    }

    public static BufferedImage scaleImage(String name, Coord chosenSize, BufferedImage defaultImage) {
        try {
            return scaleImage(name, chosenSize);
        } catch (Exception e) {
            e.printStackTrace();
            return defaultImage;
        }
    }

    public static BufferedImage scalingImage(BufferedImage before, Coord chosenSize, double scale1, double scale2) {
        BufferedImage after = new BufferedImage(chosenSize.x, chosenSize.y, BufferedImage.TYPE_INT_ARGB);
        AffineTransform scaleInstance = AffineTransform.getScaleInstance(scale1, scale2);
        AffineTransformOp scaleOp = new AffineTransformOp(scaleInstance, AffineTransformOp.TYPE_BILINEAR);

        scaleOp.filter(before, after);
        return after;
    }

    public static Tex getTex(String name, Coord chosenSize, boolean autoSize) throws IOException {
        BufferedImage in;
        File img = new File(name);
        in = ImageIO.read(img);

        BufferedImage newImage = new BufferedImage(in.getWidth(), in.getHeight(), BufferedImage.TYPE_INT_ARGB);

        Graphics2D g = newImage.createGraphics();
        g.drawImage(in, 0, 0, null);
        g.dispose();

        Tex tex;
        if (autoSize)
            tex = new TexI(scaleImage(newImage, true));
        else if (chosenSize != null)
            tex = new TexI(scaleImage(newImage, chosenSize));
        else
            tex = new TexI(newImage);

        return tex;
    }

    public static Tex getTex(String name) throws IOException {
        return getTex(name, null, false);
    }

    public static Tex getTex(String name, Coord chosenSize) throws IOException {
        return getTex(name, chosenSize, false);
    }

    public static Tex getTex(String name, boolean autoSize) throws IOException {
        return getTex(name, null, autoSize);
    }

    public static Tex imageToTex(String name, boolean autoSize, Coord chosenSize, Tex defaultTex) {
        try {
            if (autoSize)
                return getTex(name, autoSize);
            else if (chosenSize == null)
                return getTex(name);
            else
                return getTex(name, chosenSize);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(name);
            if (defaultTex == null)
                return null;
            else
                return defaultTex;
        }
    }

    public static Tex imageToTex(String name) {
        return imageToTex(name, false, null, null);
    }

    public static Tex imageToTex(String name, Coord chosenSize) {
        return imageToTex(name, false, chosenSize, null);
    }

    public static Tex imageToTex(String name, boolean autoSize) {
        return imageToTex(name, autoSize, null, null);
    }

    public static Tex imageToTex(String name, Tex defaultTex) {
        return imageToTex(name, false, null, defaultTex);
    }

    public static Tex imageToTex(String name, Coord chosenSize, Tex defaultTex) {
        return imageToTex(name, false, chosenSize, defaultTex);
    }

    public static Tex imageToTex(String name, boolean autoSize, Tex defaultTex) {
        return imageToTex(name, autoSize, null, defaultTex);
    }

    public static BufferedImage rotate(BufferedImage image, double angle) {
        AffineTransform transform = new AffineTransform();
        transform.rotate(angle, image.getWidth() / 2, image.getHeight() / 2);
        AffineTransformOp op = new AffineTransformOp(transform, AffineTransformOp.TYPE_BILINEAR);
        return image = op.filter(image, null);
    }

    public static TexI monochrome(TexI texI, Color color) {
        BufferedImage bimg = PUtils.monochromize(texI.back, color);
        return new TexI(bimg);
    }

    public static ArrayList<String> findFiles(String dir, List<String> exts) {
        try {
            File file = new File(dir);

            ArrayList<String> list = new ArrayList<String>();
            if (!file.exists()) System.out.println(dir + " folder not exists");
            for (String ext : exts) {
                File[] listFiles = file.listFiles(new MyFileNameFilter(ext));
                if (listFiles.length == 0) {
                    //System.out.println(dir + " не содержит файлов с расширением " + ext);
                } else {
                    for (File f : listFiles) {
                        list.add(dir + File.separator + f.getName());
                        //System.out.println("File: " + dir + File.separator + f.getName());
                    }
                }
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static class MyFileNameFilter implements FilenameFilter {

        private String ext;

        public MyFileNameFilter(String ext) {
            this.ext = ext.toLowerCase();
        }

        @Override
        public boolean accept(File dir, String name) {
            return name.toLowerCase().endsWith(ext);
        }
    }

    public static String getShortName(String name) {
        if (name.contains("/")) {
            int p = name.lastIndexOf('/');
            if (p < 0) return (name);
            return (name.substring(p + 1, p + 2).toUpperCase() + name.substring(p + 2));
        } else
            return (name.substring(0, 1).toUpperCase());
    }


    public static boolean snowfalloverlay = Utils.getprefb("snowfalloverlay", false);
    public static boolean blizzardoverlay = Utils.getprefb("blizzardoverlay", false);

    public static int blizzarddensity = Utils.getprefi("blizzarddensity", 5);
    public static int currentsnow = 0;

    public synchronized static int getCurrentsnow(OCache oc) {
        int count = 0;
        for (final Gob g : oc) {
            if (g.isplayer()) continue;
            if (g.findol(-4921) != null)
                count++;
        }
        return currentsnow = count;
    }

    public synchronized static void addsnow(OCache oc) {
        ArrayList<Gob> gobs = new ArrayList<>();
        oc.forEach(gobs::add);

        while (configuration.getCurrentsnow(oc) < configuration.blizzarddensity) {
            Gob g = getRandom(gobs);
            if (g.findol(-4921) != null || g.isplayer()) continue;
            g.addol(new Gob.Overlay(-4921, new SnowFall(g)));
        }
    }

    public synchronized static void deleteAllSnow(OCache oc) {
        for (final Gob g : oc) {
            if (g.isplayer()) continue;
            Gob.Overlay snow = g.findol(-4921);
            if (snow != null)
                g.ols.remove(snow);
        }
    }

    public synchronized static void deleteSnow(OCache oc) {
        ArrayList<Gob> gobs = new ArrayList<>();
        for (final Gob g : oc) {
            if (g.isplayer()) continue;
            Gob.Overlay snow = g.findol(-4921);
            if (snow != null)
                gobs.add(g);
        }

        while (configuration.getCurrentsnow(oc) > configuration.blizzarddensity) {
            Gob g = getRandom(gobs);
            Gob.Overlay snow = g.findol(-4921);
            if (snow != null)
                g.ols.remove(snow);
        }
    }

    public static Gob getRandom(ArrayList<Gob> array) {
        int rnd = new Random().nextInt(array.size());
        return array.get(rnd);
    }

    public static class SnowThread extends Thread {
        private final AtomicBoolean running = new AtomicBoolean(false);
        final OCache oc;

        public SnowThread(OCache oc) {
            super("Snowfall");
            this.oc = oc;
        }

        @Override
        public void run() {
            running.set(true);
            while (running.get() && configuration.blizzardoverlay) {
                synchronized (oc) {
                    configuration.addsnow(oc);
                }
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

        public void kill() {
            running.set(false);
            interrupt();
            configuration.deleteAllSnow(oc);
            configuration.snowThread = null;
        }
    }

    public static SnowThread snowThread;

    public static boolean autoflower = Utils.getprefb("autoflower", true);
    public static List<String> exclusion = new ArrayList<>(Arrays.asList("Gild", "Meditate", "Sing"));

    public static void addPetal(String name) {
        for (String item : exclusion) {
            if (name.contains(item)) {
                name = item;
                break;
            }
        }
        if (Config.flowermenus.get(name) == null) {
            CheckListboxItem ci = new CheckListboxItem(name);
            Config.flowermenus.put(name, ci);
            if (Config.petalsearch != null && Config.flowerlist != null && Config.petalsearch.text.equals(""))
                Config.flowerlist.items.add(ci);
            Utils.setcollection("petalcol", Config.flowermenus.keySet());
        }
    }


    public static boolean insect(Coord2d[] polygon1, Coord2d[] polygon2) {
        for (int i1 = 0; i1 < polygon1.length; i1++)
            for (int i2 = 0; i2 < polygon2.length; i2++)
                if (crossing(polygon1[i1], polygon1[i1 + 1 == polygon1.length ? 0 : i1 + 1], polygon2[i2], polygon2[i2 + 1 == polygon2.length ? 0 : i2 + 1]))
                    return (true);
        return (false);
    }

    public static boolean insect(Coord2d[] polygon1, Coord2d[] polygon2, Coord2d gobc1, Coord2d gobc2) {
        for (int i1 = 0; i1 < polygon1.length; i1++)
            for (int i2 = 0; i2 < polygon2.length; i2++)
                if (crossing(polygon1[i1].add(gobc1), polygon1[i1 + 1 == polygon1.length ? 0 : i1 + 1].add(gobc1),
                        polygon2[i2].add(gobc2), polygon2[i2 + 1 == polygon2.length ? 0 : i2 + 1].add(gobc2)))
                    return (true);
        return (false);
    }

    public static boolean insect(Coord2d[] polygon1, Coord2d[] polygon2, Gob gob1, Gob gob2) {
        Coord2d gobc1 = gob1.rc, gobc2 = gob2.rc;
        Coord2d[] p1 = new Coord2d[polygon1.length], p2 = new Coord2d[polygon2.length];
        for (int i = 0; i < polygon1.length; i++)
            p1[i] = polygon1[i].rotate((float) gob1.a).add(gobc1);
        for (int i = 0; i < polygon2.length; i++)
            p2[i] = polygon2[i].rotate((float) gob2.a).add(gobc2);
        for (int i1 = 0; i1 < polygon1.length; i1++)
            for (int i2 = 0; i2 < polygon2.length; i2++)
                if (crossing(p1[i1], p1[i1 + 1 == p1.length ? 0 : i1 + 1], p2[i2], p2[i2 + 1 == p2.length ? 0 : i2 + 1]))
                    return (true);
        return (false);
    }

    public static double vectormul(double ax, double ay, double bx, double by) {
        return (ax * by - ay * bx);
    }

    public static boolean crossing(Coord2d c1, Coord2d c2, Coord2d c3, Coord2d c4) {
//        int v1 = (int) Math.round(vectormul(c4.x - c3.x, c4.y - c3.y, c3.x - c1.x, c3.y - c1.y));
//        int v2 = (int) Math.round(vectormul(c4.x - c3.x, c4.y - c3.y, c3.x - c1.x, c3.y - c1.y));
//        int v3 = (int) Math.round(vectormul(c2.x - c1.x, c2.y - c1.y, c1.x - c3.x, c1.y - c3.y));
//        int v4 = (int) Math.round(vectormul(c2.x - c1.x, c2.y - c1.y, c1.x - c4.x, c1.y - c4.y));
        Line2D l1 = new Line2D.Double(c1.x, c1.y, c2.x, c2.y);
        Line2D l2 = new Line2D.Double(c3.x, c3.y, c4.x, c4.y);
        return l1.intersectsLine(l2);
//        return ((v1 * v2) < 0 && (v3 * v4) < 0);
    }

    public static Coord2d abs(Coord2d c, double adding) {
        return (new Coord2d(c.x + (c.x / Math.abs(c.x) * adding), c.y + (c.y / Math.abs(c.y) * adding)));
    }

    public static Coord2d[] abs(Coord2d[] c, double adding) {
        Coord2d[] c2 = new Coord2d[c.length];
        for (int i = 0; i < c.length; i++)
            c2[i] = abs(c[i], adding);
        return (c2);
    }

    public static JSONObject loadjson(String filename) {
        String result = "";
        BufferedReader br = null;
        try {
            File file = new File(filename);
            if (file.exists() && !file.isDirectory()) {
                FileReader fr = new FileReader(filename);
                br = new BufferedReader(fr);
                StringBuilder sb = new StringBuilder();
                String line = br.readLine();
                while (line != null) {
                    sb.append(line);
                    line = br.readLine();
                }
                result = sb.toString();
            } else {
                FileWriter jsonWriter = null;
                try {
                    jsonWriter = new FileWriter(filename);
                    jsonWriter.write(new JSONObject().toString());
                    return (new JSONObject());
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (jsonWriter != null) {
                            jsonWriter.flush();
                            jsonWriter.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null)
                    br.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return (new JSONObject(result));
    }

    public static void savejson(String filename, JSONObject jsonObject) {
        FileWriter jsonWriter = null;
        try {
            jsonWriter = new FileWriter(filename);
            jsonWriter.write(jsonObject.toString());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (jsonWriter != null) {
                    jsonWriter.flush();
                    jsonWriter.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static byte[] createBytes(Object object) throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ObjectOutputStream out;
        try {
            out = new ObjectOutputStream(bos);
            out.writeObject(object);
            out.flush();
            return (bos.toByteArray());
        } finally {
            try {
                bos.close();
            } catch (IOException ignore) {
                ignore.printStackTrace();
            }
        }
    }

    public static Object readBytes(byte[] bytes) throws IOException, ClassNotFoundException {
        ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
        ObjectInput in = null;
        try {
            in = new ObjectInputStream(bis);
            return (in.readObject());
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException ignore) {
                ignore.printStackTrace();
            }
        }
    }

    public static byte[] imageToBytes(BufferedImage img) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(img, "png", baos);
        return baos.toByteArray();
    }

    public static BufferedImage bytesToImage(byte[] bytes) throws IOException {
        ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
        return ImageIO.read(bais);
    }

    public static byte[] JSONArrayToBytes(JSONArray jsonArray) {
        byte[] bytes = new byte[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++) {
            bytes[i] = (byte) (((int) jsonArray.get(i)) & 0xFF);
        }
        return (bytes);
    }

    public static void decodeimage(BufferedImage bi, Resource res, String type, String n) {
        if (dev.decodeCode) {
            String hash = "";
            try {
                hash = Arrays.hashCode(configuration.imageToBytes(bi)) + "";
            } catch (IOException e) {
                e.printStackTrace();
            }
            File dir = new File("decode" + File.separator + res.toString().replace("/", File.separator));
            dir.mkdirs();
            String filename = res.name.substring(res.name.lastIndexOf('/') + 1) + "_" + n + hash + ".png";
            File outputfile = new File(dir, filename);
            if (!outputfile.exists()) {
                new Thread(() -> {
                    if (bi == null) {
                        dev.resourceLog(type, outputfile.getPath(), "NULL");
                        return;
                    }
                    try {
                        ImageIO.write(bi, "png", outputfile);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    dev.resourceLog(type, outputfile.getPath(), "CREATED");
                }, "decode " + type + " " + outputfile.getPath()).start();
            }
        }
    }

//    public static String loadToken(String username) {
//        try {
//            String loginsjson = Utils.getpref("maptokens", null);
//            if (loginsjson == null)
//                return (null);
//            JSONArray ja = new JSONArray(loginsjson);
//            for (int i = 0; i < ja.length(); i++) {
//                JSONObject jo = ja.getJSONObject(i);
//                if (jo.getString("name").equals(username)) {
//                    return (jo.getString("token"));
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return (null);
//    }
//
//    public static void saveToken(String username, String token) {
//        try {
//            String loginsjson = Utils.getpref("maptokens", null);
//            JSONArray ja;
//            if (loginsjson == null) {
//                ja = new JSONArray();
//                JSONObject jo = new JSONObject();
//                jo.put("name", username);
//                jo.put("token", token);
//                ja.put(jo);
//            } else {
//                boolean isExist = false;
//                ja = new JSONArray(loginsjson);
//                for (int i = 0; i < ja.length(); i++) {
//                    JSONObject jo = ja.getJSONObject(i);
//                    if (jo.getString("name").equals(username)) {
//                        jo.put("token", token);
//                        isExist = true;
//                        break;
//                    }
//                }
//                if (!isExist) {
//                    JSONObject jo = new JSONObject();
//                    jo.put("name", username);
//                    jo.put("token", token);
//                    ja.put(jo);
//                }
//            }
//            Utils.setpref("maptokens", ja.toString());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    public static boolean loadMapSetting(String username, String type) {
        try {
            String loginsjson = Utils.getpref("json-vendan-mapv4", null);
            if (loginsjson == null) {
                JSONArray ja = new JSONArray();
                JSONObject jo = new JSONObject();
                jo.put("name", username);
                jo.put(type, true);
                ja.put(jo);
                Utils.setpref("json-vendan-mapv4", ja.toString());
                return (true);
            }
            JSONArray ja = new JSONArray(loginsjson);
            for (int i = 0; i < ja.length(); i++) {
                JSONObject jo = ja.getJSONObject(i);
                if (jo.getString("name").equals(username)) {
                    boolean bol = true;
                    try {
                        bol = jo.get(type).toString().equals("true");
                    } catch (Exception ignored) {
                        configuration.saveMapSetting(username, bol, type);
                    }
                    return (bol);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (true);
    }

    public static void saveMapSetting(String username, boolean bol, String type) {
        try {
            String loginsjson = Utils.getpref("json-vendan-mapv4", null);
            JSONArray ja;
            if (loginsjson == null) {
                ja = new JSONArray();
                JSONObject jo = new JSONObject();
                jo.put("name", username);
                jo.put(type, bol);
                ja.put(jo);
            } else {
                boolean isExist = false;
                ja = new JSONArray(loginsjson);
                for (int i = 0; i < ja.length(); i++) {
                    JSONObject jo = ja.getJSONObject(i);
                    if (jo.getString("name").equals(username)) {
                        jo.put(type, bol);
                        isExist = true;
                        break;
                    }
                }
                if (!isExist) {
                    JSONObject jo = new JSONObject();
                    jo.put("name", username);
                    jo.put(type, bol);
                    ja.put(jo);
                }
            }
            Utils.setpref("json-vendan-mapv4", ja.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void classMaker(Runnable run) {
        try {
            run.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
