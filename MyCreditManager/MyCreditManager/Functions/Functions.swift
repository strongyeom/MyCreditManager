//
//  Functions.swift
//  MyCreditManager
//
//  Created by 염성필 on 2023/04/22.
//

import Foundation

class Functions {
    
    var students = [Student]()
    var scores = [String]()
    var grades = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"]
    
    func function() {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        let input = readLine()!
        
        switch input {
            // MARK: - 1: 학생추가
        case "1":
            addStudent()
            // MARK: - 2: 학생삭제
        case "2":
            deleteStudent()
            // MARK: - 3: 성적추가(변경)
        case "3":
            addGrade()
            // MARK: - 4: 성적삭제
        case "4":
            deleteGrade()
            // MARK: - 5: 평점보기
        case "5":
            checkScores()
            // MARK: - 종료
        case "X":
            end()
            
        default:
            // 메뉴의 잘못된 입력 처리
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            function()
        }
    }
    
    func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        let name = readLine()!
        // 공백 값 구분
        let trimName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimName.isEmpty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            function()
        } else if students.contains(where: { $0.name == name }) {
            // 이미 존재할 때
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            function()
        } else {
            print("\(String(describing: name)) 학생을 추가했습니다.")
            students.append(Student(name: name, grade: [:]))
            function()
        }
    }
    
    func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        let name = readLine()!
        let trimName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimName.isEmpty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            function()
        } else if students.contains(where: { $0.name == name }) {
            print("\(String(describing: name)) 학생을 삭제했습니다.")
            if let index = students.firstIndex(where: { $0.name == name }) {
                students.remove(at: index)
            }
            function()
        } else {
            print("\(String(describing: name)) 학생을 찾지 못했습니다.")
            function()
        }
    }
    
    func addGrade() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        let score = readLine()!
        scores = score.components(separatedBy: " ")
        if scores.count != 3 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            function()
        } else if students.contains(where: { $0.name == scores[0] }) {
            if let index = students.firstIndex(where: { $0.name == scores[0] }) {
                if grades.contains(scores[2]) {
                    students[index].grade[scores[1]] = Score(grade: scores[2])!
                    print("\(scores[0]) 학생의 \(scores[1]) 과목이 \(scores[2])로 추가(변경)되었습니다.")
                    function()
                } else {
                    print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    function()
                }
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            function()
        }
    }
    
    func deleteGrade() {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift")
        let score = readLine()!
        scores = score.components(separatedBy: " ")
        if scores.count != 2 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            function()
        } else  {
            if students.contains(where: { $0.name == scores[0] }) {
                if let index = students.firstIndex(where: { $0.name == scores[0] }) {
                    if students[index].grade.contains(where: { $0.key == scores[1] }) {
                        students[index].grade[scores[1]] = nil
                        print("\(scores[0]) 학생의 \(scores[1]) 과목의 성적이 삭제되었습니다.")
                        print(students)
                        function()
                    } else {
                        print("과목 입력이 잘못되었습니다. 다시 확인해주세요.")
                        function()
                    }
                }
            } else {
                print("\(scores[0]) 학생을 찾지 못했습니다.")
                function()
            }
        }
    }
    
    func checkScores() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        let name = readLine()!
        // 공백 값 구분
        let trimName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimName.isEmpty {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            function()
        } else {
            if let index = students.firstIndex(where: { $0.name == name }) {
                // 성적이 없을 때 예외처리
                if students[index].grade.isEmpty {
                    print("추가한 성적이 없습니다. 성적을 추가해주세요.")
                    function()
                } else {
                    for i in students[index].grade {
                        print("\(i.key): \(i.value.convertRawToString())")
                    }
                    print("평점: \(students[index].score)")
                    function()
                }
            } else {
                print("\(name) 학생을 찾지 못했습니다.")
                function()
            }
        }
    }
    
    func end() {
        print("프로그램을 종료합니다...")
    }
}
