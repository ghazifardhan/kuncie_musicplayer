package com.ghazifadil.kuncie_musicplayer

import android.media.AudioManager
import android.media.MediaPlayer
import androidx.annotation.NonNull

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.IOException

class MainActivity: FlutterActivity() {

    private val MEDIAPLAYER_CHANNEL = "com.ghazifadil.dev/mediaplayer"

    var mediaPlayer: MediaPlayer? = null;

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, MEDIAPLAYER_CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "playAudio") {
                // url is data pass from flutter to native kotlin
                val url = call.argument<String>("url")
                val response = this.playAudio(url!!)
                result.success(response)
            } else if (call.method == "pauseAudio") {
                val response = this.pauseAudio()
                result.success(response)
            } else if (call.method == "releaseAudio") {
                val response = this.releaseAudio()
                result.success(response)
            } else if (call.method == "getAudioInfo") {
                val response = this.getAudioInfo()
                result.success(response)
            }
        }
    }

    // get audio info from media player
    private fun getAudioInfo(): HashMap<String, Any?> {
        if (mediaPlayer != null) {
            val data = HashMap<String, Any?>()
            data["duration"] = mediaPlayer!!.duration
            data["currentPosition"] = mediaPlayer!!.currentPosition
            data["isPlaying"] = mediaPlayer!!.isPlaying
            data["isLooping"] = mediaPlayer!!.isLooping
            return data
        } else {
            val data = HashMap<String, Any?>()
            data["duration"] = null
            data["currentPosition"] = null
            data["isPlaying"] = null
            data["isLooping"] = null
            return data
        }
    }

    // play audio from media player
    private fun playAudio(url: String): String {
        if (mediaPlayer == null) {
            try {
                mediaPlayer = MediaPlayer()
                mediaPlayer!!.setDataSource(url)
                mediaPlayer!!.prepare()
                mediaPlayer!!.start()

                return "audio is playing"
            } catch (e: IOException) {
                return e.toString()
            }
        } else {
            if (!mediaPlayer!!.isPlaying) {
                mediaPlayer!!.start()
            }
            return "audio is playing"
        }
    }

    // pause audio from media player
    private fun pauseAudio(): String {
        if (mediaPlayer != null) {
            try {
                if (mediaPlayer!!.isPlaying) {
                    mediaPlayer!!.pause()
                    return "audio has been stopped"
                } else {
                    return "audio has not played"
                }
            } catch (e: IOException) {
                return e.toString()
            }
        } else {
            return "audio has not played"
        }
    }

    // release audio from media player
    private fun releaseAudio(): String {
        if (mediaPlayer != null) {
            mediaPlayer!!.release()
            mediaPlayer = null
            return "audio player released"
        } else {
            return "audio player has not been initialized"
        }
    }
}
