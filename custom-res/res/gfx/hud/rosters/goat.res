Haven Resource 19 src t  Goat.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Goat extends Entry {
    public int meat, milk, wool;
    public int meatq, milkq, woolq, hideq;
    public int seedq;
    public boolean billy, kid, dead, pregnant;

    public Goat(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, GoatRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, GoatRoster.cols.get(i), 0.5, billy,    sex, i++);
	drawcol(g, GoatRoster.cols.get(i), 0.5, kid,      growth, i++);
	drawcol(g, GoatRoster.cols.get(i), 0.5, dead,     deadrend, i++);
	drawcol(g, GoatRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, wool, null, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, woolq, percent, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, GoatRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(GoatRoster.cols.get(1).hasx(c.x)) {
	    markall(Goat.class, o -> (o.billy == this.billy));
	    return(true);
	}
	if(GoatRoster.cols.get(2).hasx(c.x)) {
	    markall(Goat.class, o -> (o.kid == this.kid));
	    return(true);
	}
	if(GoatRoster.cols.get(3).hasx(c.x)) {
	    markall(Goat.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(GoatRoster.cols.get(4).hasx(c.x)) {
	    markall(Goat.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: GoatRoster */
src /  GoatRoster.java /* Preprocessed source code */
/* $use: ui/croster */

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class GoatRoster extends CattleRoster<Goat> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Goat e) -> e.billy).reversed(), 20).runon(),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Goat e) -> e.kid).reversed(), 20).runon(),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Goat e) -> e.dead).reversed(), 20).runon(),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Goat e) -> e.pregnant).reversed(), 20),

	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Goat e) -> e.q).reversed()),

	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Goat e) -> e.meat).reversed()),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Goat e) -> e.milk).reversed()),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/woolquantity", 1), Comparator.comparing((Goat e) -> e.milk).reversed()),

	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Goat e) -> e.meatq).reversed()),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Goat e) -> e.milkq).reversed()),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/woolquality", 1), Comparator.comparing((Goat e) -> e.milkq).reversed()),
	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Goat e) -> e.hideq).reversed()),

	new Column<Goat>(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Goat e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new GoatRoster());
    }

    public Goat parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Goat ret = new Goat(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.billy = (fl & 1) != 0;
	ret.kid = (fl & 2) != 0;
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
	return(typebtn(Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/btn-goat", 4),
		       Resource.classres(GoatRoster.class).pool.load("gfx/hud/rosters/btn-goat-d", 3)));
    }
}
code �  Goat ����   4 �	 $ J
 + K
 $ L	 M N O P Q	 $ R
 $ S?�      	 $ T
 U V	 $ W	 $ X	 $ Y	 $ Z	 $ [	 $ \	 $ ]	 $ ^
 _ `	 $ a	 $ b
 c d	 $ e	 $ f	 $ g	 $ h	 $ i	 $ j	 $ k	 $ l
 + m	 n o
  p q   w
 $ x  w  w  w
 + | } meat I milk wool meatq milkq woolq hideq seedq billy Z kid dead pregnant <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V 	mousedown (Lhaven/Coord;I)Z StackMapTable lambda$mousedown$3 	(LGoat;)Z lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile 	Goat.java ~  : � � ? � � � � � � haven/res/ui/croster/Column � � � � 5 6 � � � � � 7 6 � � 8 6 � � 9 6 � � � � � � � � � , - � � � . - / - 0 - � � 1 - 2 - 3 - 4 - > ? � � - � � Goat BootstrapMethods � � � D � � � � � � � @ A haven/res/ui/croster/Entry SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg 
GoatRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend q D java/lang/Double (D)Ljava/lang/Double; quality java/lang/Integer (I)Ljava/lang/Integer; percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 $ � test &(LGoat;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 $ �
 $ �
 $ � � � � G D F D E D C D "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 
goat.cjava ! $ +     , -    . -    / -    0 -    1 -    2 -    3 -    4 -    5 6    7 6    8 6    9 6     : ;  <   &     
*� -� �    =   
     	   > ?  <  #    �*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *� � � �� *+� �  � *�  � �� *+� !�    =   J         !  C  e  �  �  �  �  # C c �  � !� "� #  @ A  <   �     �� �  � +� "� #� *$*� %  � &�� �  � +� "� #� *$*� '  � &�� �  � +� "� #� *$*� (  � &�� �  � +� "� #� *$*� )  � &�*+� *�    B    $### =   6    &  ' " ( $ * : + F , H . ^ / j 0 l 2 � 3 � 4 � 6 C D  <   4     +� *� � � �    B    @ =       3 E D  <   4     +� *� � � �    B    @ =       / F D  <   4     +� *� � � �    B    @ =       + G D  <   4     +� *� � � �    B    @ =       '  r   *  s  t u v s  t y v s  t z v s  t { v H    � �   
  � � � code   GoatRoster ����   48
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
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse ([Ljava/lang/Object;)LGoat; StackMapTable z � } ~ button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$13 (LGoat;)Ljava/lang/Integer; lambda$static$12 lambda$static$11 lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 lambda$static$6 lambda$static$5 (LGoat;)Ljava/lang/Double; lambda$static$4 (LGoat;)Ljava/lang/Boolean; lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> +Lhaven/res/ui/croster/CattleRoster<LGoat;>; 
SourceFile GoatRoster.java P Q L M 
GoatRoster java/lang/Long � � java/lang/String Goat P � java/lang/Integer � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � � � � � � � � � � � � � gfx/hud/rosters/btn-goat � � � gfx/hud/rosters/btn-goat-d � � X Y � � � � � � � � � � � haven/res/ui/croster/Column Name BootstrapMethods  s P gfx/hud/rosters/sex	 n
 P gfx/hud/rosters/growth gfx/hud/rosters/deadp gfx/hud/rosters/pregnant gfx/hud/rosters/quality l P gfx/hud/rosters/meatquantity c gfx/hud/rosters/milkquantity gfx/hud/rosters/woolquantity gfx/hud/rosters/meatquality gfx/hud/rosters/milkquality gfx/hud/rosters/woolquality gfx/hud/rosters/hidequality gfx/hud/rosters/breedingquality !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I billy Z kid dead pregnant doubleValue ()D q D meat milk wool meatq milkq woolq hideq seedq haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
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
 . initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$Named/03 r s q n p n o n m n k l j c i c h c g c f c e c d c b c "java/lang/invoke/LambdaMetafactory metafactory5 Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;6 %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 
goat.cjava !  K    	 L M  N    O   P Q  R        *� �    S       ;  L T  R        � �    S       Q N    U � V W  R         � Y� �    S       T � X Y  R      &=+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    Z   � � R  [ \ ] ^  ^�    [ \ ] ^  ^O ^�    [ \ ] ^  ^O ^�    [ \ ] ^  ^P ^�    [ \ ] ^  ^ S   R    X  Y  Z  [ & \ 7 ] E ^ V _ g ` x a � b � c � d � e � f � g � h i j# k  _ `  R   @      � � � � �  � � !�    S       o  p  oA X a  R        *+� "�    S       ;
 b c  R         *� � #�    S       O
 d c  R         *� � #�    S       M
 e c  R         *� � #�    S       L
 f c  R         *� � #�    S       K
 g c  R         *� � #�    S       J
 h c  R         *� � #�    S       H
 i c  R         *� � #�    S       G
 j c  R         *� � #�    S       F
 k l  R         *� � $�    S       D
 m n  R         *� � %�    S       B
 o n  R         *� � %�    S       A
 p n  R         *� � %�    S       @
 q n  R         *� � %�    S       ?
 r s  R        *� &�    S       =  t Q  R  q     � 'Y� 'Y(� )  � * ȷ +SY� 'Y� � ,� � -  � *� . � /� 0SY� 'Y� � 1� � 2  � *� . � /� 0SY� 'Y� � 3� � 4  � *� . � /� 0SY� 'Y� � 5� � 6  � *� . � /SY� 'Y� � 7� � 8  � *� . � 9SY� 'Y� � :� � ;  � *� . � 9SY� 'Y� � <� � =  � *� . � 9SY� 'Y� � >� � ?  � *� . � 9SY	� 'Y� � @� � A  � *� . � 9SY
� 'Y� � B� � C  � *� . � 9SY� 'Y� � D� � E  � *� . � 9SY� 'Y� � F� � G  � *� . � 9SY� 'Y� � H� � I  � *� . � 9S� J� �    S   B    <  = $ ? N @ x A � B � D � F G; Ha J� K� L� M� O <  �   �  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � v   7 N    u �     � � � 	 � � �	142 codeentry !   wdg GoatRoster   ui/croster D  