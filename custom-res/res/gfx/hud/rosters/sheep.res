Haven Resource 19 src �  Sheep.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Sheep extends Entry {
    public int meat, milk, wool;
    public int meatq, milkq, woolq, hideq;
    public int seedq;
    public boolean ram, lamb, dead, pregnant;

    public Sheep(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, SheepRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, SheepRoster.cols.get(i), 0.5, ram,      sex, i++);
	drawcol(g, SheepRoster.cols.get(i), 0.5, lamb,     growth, i++);
	drawcol(g, SheepRoster.cols.get(i), 0.5, dead,     deadrend, i++);
	drawcol(g, SheepRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, wool, null, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, woolq, percent, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, SheepRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(SheepRoster.cols.get(1).hasx(c.x)) {
	    markall(Sheep.class, o -> (o.ram == this.ram));
	    return(true);
	}
	if(SheepRoster.cols.get(2).hasx(c.x)) {
	    markall(Sheep.class, o -> (o.lamb == this.lamb));
	    return(true);
	}
	if(SheepRoster.cols.get(3).hasx(c.x)) {
	    markall(Sheep.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(SheepRoster.cols.get(4).hasx(c.x)) {
	    markall(Sheep.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: SheepRoster */
src _  SheepRoster.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class SheepRoster extends CattleRoster<Sheep> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Sheep e) -> e.ram).reversed(), 20).runon(),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Sheep e) -> e.lamb).reversed(), 20).runon(),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Sheep e) -> e.dead).reversed(), 20).runon(),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Sheep e) -> e.pregnant).reversed(), 20),

	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Sheep e) -> e.q).reversed()),

	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Sheep e) -> e.meat).reversed()),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Sheep e) -> e.milk).reversed()),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/woolquantity", 1), Comparator.comparing((Sheep e) -> e.wool).reversed()),

	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Sheep e) -> e.meatq).reversed()),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Sheep e) -> e.milkq).reversed()),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/woolquality", 1), Comparator.comparing((Sheep e) -> e.woolq).reversed()),
	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Sheep e) -> e.hideq).reversed()),

	new Column<Sheep>(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Sheep e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new SheepRoster());
    }

    public Sheep parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Sheep ret = new Sheep(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.ram = (fl & 1) != 0;
	ret.lamb = (fl & 2) != 0;
	ret.dead = (fl & 4) != 0;
	ret.pregnant = (fl & 8) != 0;
	ret.q = ((Number)args[n++]).doubleValue();
	ret.meat = (Integer)args[n++];
	ret.milk = (Integer)args[n++];
	ret.wool = (Integer)args[n++];
	ret.meatq = (Integer)args[n++];
	ret.milkq = (Integer)args[n++];
	ret.woolq = (Integer)args[n++];
	ret.hideq = (Integer)args[n++];
	ret.seedq = (Integer)args[n++];
	return(ret);
    }

    public TypeButton button() {
	return(typebtn(Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/btn-sheep", 2),
		       Resource.classres(SheepRoster.class).pool.load("gfx/hud/rosters/btn-sheep-d", 2)));
    }
}
code   SheepRoster ����   48
 K x	  y z
  x {
  | } ~
   �
 
 �	  �	  �	  �	  �	  � �
  �	  �	  �	  �	  �	  �	  �	  �	  �	  �
 � �	 � � �
 � � �
  �
  �
 
 �
 � �
 � �	 � � � �   � � �
 ' � �  � � �
 ' �
 ' � �  � �  � �  � �  �
 ' � �  � �  � �  � � 	 � � 
 � �  � �  � �  �
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse ([Ljava/lang/Object;)LSheep; StackMapTable z � } ~ button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$13 (LSheep;)Ljava/lang/Integer; lambda$static$12 lambda$static$11 lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 lambda$static$6 lambda$static$5 (LSheep;)Ljava/lang/Double; lambda$static$4 (LSheep;)Ljava/lang/Boolean; lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> ,Lhaven/res/ui/croster/CattleRoster<LSheep;>; 
SourceFile SheepRoster.java P Q L M SheepRoster java/lang/Long � � java/lang/String Sheep P � java/lang/Integer � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � � � � � � � � � � � � � gfx/hud/rosters/btn-sheep � � � gfx/hud/rosters/btn-sheep-d � � X Y � � � � � � � � � � � haven/res/ui/croster/Column Name BootstrapMethods  s P gfx/hud/rosters/sex	 n
 P gfx/hud/rosters/growth gfx/hud/rosters/deadp gfx/hud/rosters/pregnant gfx/hud/rosters/quality l P gfx/hud/rosters/meatquantity c gfx/hud/rosters/milkquantity gfx/hud/rosters/woolquantity gfx/hud/rosters/meatquality gfx/hud/rosters/milkquality gfx/hud/rosters/woolquality gfx/hud/rosters/hidequality gfx/hud/rosters/breedingquality !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I ram Z lamb dead pregnant doubleValue ()D q D meat milk wool meatq milkq woolq hideq seedq haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
  &(Ljava/lang/Object;)Ljava/lang/Object;
 ! apply ()Ljava/util/function/Function; java/util/Comparator 	comparing 5(Ljava/util/function/Function;)Ljava/util/Comparator; ,(Ljava/lang/String;Ljava/util/Comparator;I)V
 " reversed ()Ljava/util/Comparator; '(Lhaven/Indir;Ljava/util/Comparator;I)V runon ()Lhaven/res/ui/croster/Column;
 #
 $
 %
 & &(Lhaven/Indir;Ljava/util/Comparator;)V
 '
 (
 )
 *
 +
 ,
 -
 . initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$Named/03 r s q n p n o n m n k l j c i c h c g c f c e c d c b c "java/lang/invoke/LambdaMetafactory metafactory5 Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;6 %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles sheep.cjava !  K    	 L M  N    O   P Q  R        *� �    S       ;  L T  R        � �    S       Q N    U � V W  R         � Y� �    S       T � X Y  R      &=+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    Z   � � R  [ \ ] ^  ^�    [ \ ] ^  ^O ^�    [ \ ] ^  ^O ^�    [ \ ] ^  ^P ^�    [ \ ] ^  ^ S   R    X  Y  Z  [ & \ 7 ] E ^ V _ g ` x a � b � c � d � e � f � g � h i j# k  _ `  R   @      � � � � �  � � !�    S       o  p  oA X a  R        *+� "�    S       ;
 b c  R         *� � #�    S       O
 d c  R         *� � #�    S       M
 e c  R         *� � #�    S       L
 f c  R         *� � #�    S       K
 g c  R         *� � #�    S       J
 h c  R         *� � #�    S       H
 i c  R         *� � #�    S       G
 j c  R         *� � #�    S       F
 k l  R         *� � $�    S       D
 m n  R         *� � %�    S       B
 o n  R         *� � %�    S       A
 p n  R         *� � %�    S       @
 q n  R         *� � %�    S       ?
 r s  R        *� &�    S       =  t Q  R  q     � 'Y� 'Y(� )  � * ȷ +SY� 'Y� � ,� � -  � *� . � /� 0SY� 'Y� � 1� � 2  � *� . � /� 0SY� 'Y� � 3� � 4  � *� . � /� 0SY� 'Y� � 5� � 6  � *� . � /SY� 'Y� � 7� � 8  � *� . � 9SY� 'Y� � :� � ;  � *� . � 9SY� 'Y� � <� � =  � *� . � 9SY� 'Y� � >� � ?  � *� . � 9SY	� 'Y� � @� � A  � *� . � 9SY
� 'Y� � B� � C  � *� . � 9SY� 'Y� � D� � E  � *� . � 9SY� 'Y� � F� � G  � *� . � 9SY� 'Y� � H� � I  � *� . � 9S� J� �    S   B    <  = $ ? N @ x A � B � D � F G; Ha J� K� L� M� O <  �   �  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � v   7 N    u �     � � � 	 � � �	142 code �  Sheep ����   4 �	 $ J
 + K
 $ L	 M N O P Q	 $ R
 $ S?�      	 $ T
 U V	 $ W	 $ X	 $ Y	 $ Z	 $ [	 $ \	 $ ]	 $ ^
 _ `	 $ a	 $ b
 c d	 $ e	 $ f	 $ g	 $ h	 $ i	 $ j	 $ k	 $ l
 + m	 n o
  p q   w
 $ x  w  w  w
 + | } meat I milk wool meatq milkq woolq hideq seedq ram Z lamb dead pregnant <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V 	mousedown (Lhaven/Coord;I)Z StackMapTable lambda$mousedown$3 
(LSheep;)Z lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile 
Sheep.java ~  : � � ? � � � � � � haven/res/ui/croster/Column � � � � 5 6 � � � � � 7 6 � � 8 6 � � 9 6 � � � � � � � � � , - � � � . - / - 0 - � � 1 - 2 - 3 - 4 - > ? � � - � � Sheep BootstrapMethods � � � D � � � � � � � @ A haven/res/ui/croster/Entry SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg SheepRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend q D java/lang/Double (D)Ljava/lang/Double; quality java/lang/Integer (I)Ljava/lang/Integer; percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 $ � test '(LSheep;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 $ �
 $ �
 $ � � � � G D F D E D C D "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles sheep.cjava ! $ +     , -    . -    / -    0 -    1 -    2 -    3 -    4 -    5 6    7 6    8 6    9 6     : ;  <   &     
*� -� �    =   
     	   > ?  <  #    �*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *�  � �� *+� !�    =   J         !  C  e  �  �  �  �  # C c �  � !� "� #  @ A  <   �     �� �  � +� "� #� *$*� %  � &�� �  � +� "� #� *$*� '  � &�� �  � +� "� #� *$*� (  � &�� �  � +� "� #� *$*� )  � &�*+� *�    B    $### =   6    &  ' " ( $ * : + F , H . ^ / j 0 l 2 � 3 � 4 � 6 C D  <   4     +� *� � � �    B    @ =       3 E D  <   4     +� *� � � �    B    @ =       / F D  <   4     +� *� � � �    B    @ =       + G D  <   4     +� *� � � �    B    @ =       '  r   *  s  t u v s  t y v s  t z v s  t { v H    � �   
  � � � codeentry "   wdg SheepRoster   ui/croster D  