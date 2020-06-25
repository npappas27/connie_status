//
//  ViewController.swift
//  Connie Status
//
//  Created by Nick Pappas on 6/24/20.
//  Copyright © 2020 Nick Pappas. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        
        
        let screenWidth = view.bounds.width
        stackView.backgroundColor = UIColor.red
        
        
        let blockView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 100))
        blockView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 25, width: screenWidth, height: 150))
        titleLabel.text = "Does Connie have a job yet?"
        titleLabel.font = UIFont(name: "Avenir-Roman", size: 48)
        titleLabel.numberOfLines = 3
        titleLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        titleLabel.textAlignment = .center
        
        
        let jobYesOrNoLabel = UILabel(frame: CGRect(x: 0, y: 175, width: screenWidth, height: 150))
        jobYesOrNoLabel.text = "NO!"
        jobYesOrNoLabel.font = UIFont(name: "ArialHebrew-Bold", size: 60)
        jobYesOrNoLabel.textColor = UIColor.red
        jobYesOrNoLabel.numberOfLines = 3
        jobYesOrNoLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        jobYesOrNoLabel.textAlignment = .center
        jobYesOrNoLabel.layer.borderColor = UIColor.black.cgColor
        jobYesOrNoLabel.layer.borderWidth = 3
        
        let daysSinceGraduationLabel = UILabel(frame: CGRect(x: 0, y: 325, width: screenWidth, height: 150))
        daysSinceGraduationLabel.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        daysSinceGraduationLabel.numberOfLines = 3
        daysSinceGraduationLabel.textAlignment = .center
        daysSinceGraduationLabel.font = UIFont(name: "Avenir-Roman", size: 48)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let graduationDate = dateFormatter.date(from: "2020-05-16")!
      
        let date = Date()
        let days = Date.daysBetween(start: graduationDate, end: date)
        
        daysSinceGraduationLabel.text = "It's been " + String(days) + " days... and still no job?"
        
        
        let hungoverLabel = UILabel(frame: CGRect(x: 0, y: 475, width: screenWidth, height: 150))
        hungoverLabel.text = "Is Connie hungover?"
        hungoverLabel.font = UIFont(name: "Avenir-Roman", size: 48)
        hungoverLabel.numberOfLines = 3
        hungoverLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        hungoverLabel.textAlignment = .center
        
        let hungoverYesOrNoLabel = UILabel(frame: CGRect(x: 0, y: 625, width: screenWidth, height: 150))
        hungoverYesOrNoLabel.text = "YES!"
        hungoverYesOrNoLabel.font = UIFont(name: "ArialHebrew-Bold", size: 60)
        hungoverYesOrNoLabel.textColor = UIColor.red
        hungoverYesOrNoLabel.numberOfLines = 3
        hungoverYesOrNoLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        hungoverYesOrNoLabel.textAlignment = .center
        hungoverYesOrNoLabel.layer.borderColor = UIColor.black.cgColor
        hungoverYesOrNoLabel.layer.borderWidth = 3
        
        
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        
        let xPostion:CGFloat = 0
        let yPostion:CGFloat = 775
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        
        button.backgroundColor = UIColor.lightGray
        button.isUserInteractionEnabled = true
        button.setTitle("Tap me", for: UIControl.State.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        
        
        button.backgroundColor = .orange
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        stackView.isUserInteractionEnabled = false
        stackView.addSubview(blockView)
        stackView.addSubview(titleLabel)
        stackView.addSubview(jobYesOrNoLabel)
        stackView.addSubview(daysSinceGraduationLabel)
        stackView.addSubview(hungoverLabel)
        stackView.addSubview(hungoverYesOrNoLabel)
        view.addSubview(button)
        view.addSubview(stackView)
        super.viewDidLoad()
        
    }
    
    @objc func buttonAction(_ sender:UIButton!){
        print("Button Pressed")
        if let soundURL = Bundle.main.url(forResource: "connie", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            }
            catch {
                print(error)
            }
            audioPlayer.play()
        }else{
            print("Unable to locate audio file")
        }
    }
}

extension Date {
    
    func daysBetween(date: Date) -> Int {
        return Date.daysBetween(start: self, end: date)
    }
    
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)
        
        let a = calendar.dateComponents([.day], from: date1, to: date2)
        return a.value(for: .day)!
    }
}
