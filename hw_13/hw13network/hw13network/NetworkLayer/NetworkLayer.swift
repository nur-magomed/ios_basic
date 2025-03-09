//
//  NetworkLayer.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

import Foundation

struct NetworkLayer {

    private let apiLayer = ApiLayer()
    
    func getQuran() {
        let request = URLRequest(url: URL(string: "https://api.alquran.cloud/v1/quran/quran-simple-clean")!)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                print(someError)
            case .success(let responseData):
                
                let decoder = JSONDecoder()
                
                do {
                     let parsed = try decoder.decode(NetworkAllSurahsResponse.self, from: responseData)
                     print("getting data")
                     print(parsed)
                } catch {
                    print(error)
                     let msg = error.localizedDescription
                     print(msg)
                }
            }
        }
        
    }
    
    public func getMetaData(_ callback: @escaping (Result<[Surah], NetworkError>) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.alquran.cloud/v1/meta")!)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                print(someError)
            case .success(let responseData):
                if let parsed: NetworkMetaResponse = try? JSONDecoder().decode(NetworkMetaResponse.self, from: responseData) {
                    let surahs: [Surah] = parsed.data.surahs.references.map { referenceSurah in
                        Surah(number: referenceSurah.number, name: referenceSurah.name, englishName: referenceSurah.englishName, englishNameTranslation: referenceSurah.englishNameTranslation, revelationType: RevelationType(rawValue: referenceSurah.revelationType.rawValue) ?? RevelationType.meccan, numberOfAyahs: referenceSurah.numberOfAyahs, ayahs: [])
                    }
                    callback(.success(surahs))
                } else {
                    callback(.failure(.parsingError))
                }
            }
        }
    }
    
    public func getSurah(surahNumber: Int, _ callback: @escaping (Result<Surah, NetworkError>) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.alquran.cloud/v1/surah/\(surahNumber)")!)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                print(someError)
            case .success(let responseData):
                if let parsed: NetworkResponse = try? JSONDecoder().decode(NetworkResponse.self, from: responseData) {
                    let ayahs: [Ayah] = parsed.data.ayahs.map { networkAyah in
                        Ayah(number: networkAyah.number, text: networkAyah.text, numberInSurah: networkAyah.numberInSurah, juz: networkAyah.juz, page: networkAyah.page, sajda: networkAyah.sajda.isSajda())
                    }
                    let surah: Surah = Surah(number: parsed.data.number, name: parsed.data.name, englishName: parsed.data.englishName, englishNameTranslation: parsed.data.englishNameTranslation, revelationType: RevelationType(rawValue: parsed.data.revelationType) ?? RevelationType.meccan, numberOfAyahs: ayahs.count, ayahs: ayahs)
                    callback(.success(surah))
                } else {
                    callback(.failure(.parsingError))
                }
            }
        }
    }
    
    public func getTranslatedSurah(surahNumber: Int, edition: String, _ callback: @escaping (Result<Surah, NetworkError>) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.alquran.cloud/v1/surah/\(surahNumber)/\(edition)")!)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                print(someError)
            case .success(let responseData):
                if let parsed: NetworkResponse = try? JSONDecoder().decode(NetworkResponse.self, from: responseData) {
                    let ayahs: [Ayah] = parsed.data.ayahs.map { networkAyah in
                        Ayah(number: networkAyah.number, text: networkAyah.text, numberInSurah: networkAyah.numberInSurah, juz: networkAyah.juz, page: networkAyah.page, sajda: networkAyah.sajda.isSajda())
                    }
                    let surah: Surah = Surah(number: parsed.data.number, name: parsed.data.name, englishName: parsed.data.englishName, englishNameTranslation: parsed.data.englishNameTranslation, revelationType: RevelationType(rawValue: parsed.data.revelationType) ?? RevelationType.meccan, numberOfAyahs: ayahs.count, ayahs: ayahs)
                    callback(.success(surah))
                } else {
                    callback(.failure(.parsingError))
                }
            }
        }
    }
}
