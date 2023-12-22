package com.abanoubhanna.bible;

import android.graphics.Color;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GestureDetectorCompat;

import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainActivity extends AppCompatActivity {

    TextView content;
    private ScaleGestureDetector scaleGestureDetector;
    private GestureDetectorCompat detector;
    FloatingActionButton fab, fab1, fab2, fab3;
    Toolbar toolbar;
    int page = 0;
    char book = 'a';
    boolean punctuated = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        toolbar = findViewById(R.id.toolbar);
        toolbar.setTitleTextColor(Color.WHITE);
        setSupportActionBar(toolbar);

        scaleGestureDetector = new ScaleGestureDetector(this, new simpleOnScaleGestureListener());
        detector = new GestureDetectorCompat(this, new simpleOnScaleGestureListener());

        content = findViewById(R.id.contenttv);
        content.setVerticalScrollBarEnabled(true);
        content.setBackgroundColor(getResources().getColor(R.color.colorPrimaryBg));
        //content.setTextIsSelectable(true);

        //show last-read pin
        page = page + 1;

        content.setText(loadText(book, page));

        fab = findViewById(R.id.fab);
        fab1 = findViewById(R.id.fab1);
        fab2 = findViewById(R.id.fab2);
        fab3 = findViewById(R.id.fab3);
    }

    private void prevChapter() {
        //1. set the page
        if (page > 1) page = page - 1;
        //2. set the title according to the book and page
        switch (book) {
            case 'a':
                toolbar.setTitle("Genesis " + page);
                break;
            case 'b':
                toolbar.setTitle("2nd " + page);
                break;
        }
        //3. set the content accordingly
        content.setText(loadText(book, page));
    }

    private void nextChapter() {
        //1. set the page
        page = page + 1;
        //2. set the title according to the book and page
        switch (book) {
            case 'a':
                toolbar.setTitle("Genesis " + page);
                break;
            case 'b':
                toolbar.setTitle("2nd " + page);
                break;
        }
        //3. set the content accordingly
        content.setText(loadText(book, page));
    }

    private String loadText(char book, Integer chapter) {
        String text = "";
        try {
            InputStream stream = getAssets().open("" + book + chapter + ".txt");
            int size = stream.available();
            byte[] buffer = new byte[size];
            stream.read(buffer);
            stream.close();
            text = new String(buffer);
        } catch (IOException e) {
            note("can't read files!");
        }
        return text;
    }

    private void note(String text) {
        Snackbar.make(findViewById(R.id.fab), text, Snackbar.LENGTH_LONG)
                .setAction("Action", null).show();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.arabic:
                if (punctuated) {
                    //un punctuate text
                    String text = content.getText().toString();
                    Pattern p = Pattern.compile("[\\p{P}\\p{Mn}]");
                    Matcher m = p.matcher(text);
                    content.setText(m.replaceAll(""));
                    punctuated = false;
                } else {
                    //load punctuated text from assets
                    content.setText(loadText(book, page));
                    punctuated = true;
                }
                return true;
            case R.id.fav:
                note("show the fav verses");
                return true;
            default:
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (this.scaleGestureDetector.onTouchEvent(event) || this.detector.onTouchEvent(event)) {
            return true;
        }
        return super.onTouchEvent(event);
    }

    public void fabClicked(View view) {
        if (view.getId() == R.id.fab) {
            fab.hide();
            fab1.show();
            fab2.show();
            fab3.show();
        } else {
            fab.show();
            fab1.hide();
            fab2.hide();
            fab3.hide();
        }
    }

    class simpleOnScaleGestureListener
            extends ScaleGestureDetector.SimpleOnScaleGestureListener
            implements GestureDetector.OnGestureListener {

        @Override
        public boolean onScale(ScaleGestureDetector detector) {
            float size = content.getTextSize();
            float factor = detector.getScaleFactor();
            float product = size * factor;
            content.setTextSize(TypedValue.COMPLEX_UNIT_PX, product);
            size = content.getTextSize();
            //note("" + size);
            return true;
        }

        @Override
        public boolean onDown(MotionEvent e) {
            return true;
        }

        @Override
        public void onShowPress(MotionEvent e) {

        }

        @Override
        public boolean onSingleTapUp(MotionEvent e) {
            return true;
        }

        @Override
        public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
            note("on scroll");
            return true;
        }

        @Override
        public void onLongPress(MotionEvent e) {

        }

        @Override
        public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
            note("on fling");
            return true;
        }
    }
}