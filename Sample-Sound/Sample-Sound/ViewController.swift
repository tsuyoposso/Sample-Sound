//
//  ViewController.swift
//  Sample-Sound
//
//  Created by 長坂豪士 on 2019/09/09.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    
    @IBAction func tapSystemSound(_ sender: Any) {
        // システムサウンド1000番を鳴らしつつバイブレーションを振動させる
        // マナーモードの場合はバイブレーションのみ
        AudioServicesPlaySystemSoundWithCompletion(1000) {
            // ここにはサウンドが鳴り終わった後に呼ばれる処理がくる
        }
    }
    
    @IBAction func tapCustomSound(_ sender: Any) {
        // 指定するサウンドファイルは再生時間が30秒以下であること
        let soundUrl = Bundle.main.url(forResource: "costom", withExtension: "mp3")
        
        // サウンドIDを登録するための変数を用意
        var soundId: SystemSoundID = 0
        // サウンドファイルを登録してサウンドIDwo取得
        AudioServicesCreateSystemSoundID(soundUrl! as CFURL, &soundId)
        //取得したサウンドIDを使用してサウンドを鳴らす
        AudioServicesPlaySystemSoundWithCompletion(soundId) {
            // 必要のおうじてサウンドが鳴り終わった後の処理を記載する
        }
        
    }
    
    @IBAction func tapVibration(_ sender: Any) {
        // バイブレーションのみを発生させる
                AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) {
            // バイブレーションが終わった後の処理を記載
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

