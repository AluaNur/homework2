//
//  TableViewController.swift
//  homework2
//
//  Created by Alua Nurakhanova on 10.08.2023.
//

import UIKit

class TableViewController: UITableViewController {
     var arrayMovies = [Movie(name: "Barbie", yearOfRelease: 2023, imageName: "barbie", description: """
                        Barbie (Margot Robbie), the most popular of all the Barbies in Barbieland, begins experiencing an existential crisis. She must travel to the human world in order to understand herself and discover her true purpose. Her kinda-sorta boyfriend, Ken (Ryan Gosling), comes along for the ride because his own existence depends on Barbie acknowledging him. Both discover harsh truths—and make new friends –along the road to enlightenment
"""),
                        Movie(name: "Avatar : The way of water", yearOfRelease: 2023, imageName: "avatar", description: """
                        Pandora, 2170. Having found meaning and purpose in the heart of the extrasolar Garden of Eden, formerly paraplegic Marine veteran Jake Sully and his fierce warrior princess companion Neytiri enjoy peace and prosperity after the life-altering events of Avatar (2009). But happiness is fleeting. And when the unsightly ghosts of Sully's past emerge, sixteen years after the all-out Assault on the Tree of Souls, the human Toruk Makto and the Na'vi must fight back. Now, Jake and the Omatikaya clan have no choice but to pick up where they left off to defend their home. In the upcoming war against the unstoppable Sky People, will blind revenge destroy everything Sully holds dear?
"""),
                        Movie(name: "Patriot's Day", yearOfRelease: 2016, imageName: "patriotsday", description: """
                        On the last day of his suspension--as Massachusetts prepares for the demanding annual Boston Marathon--reluctantly, the injured Boston police sergeant, Tommy Saunders, arrives at the bustling-with-people finish line, on April 15, 2013. But, under everyone's noses, amid enthusiastic but unsuspecting spectators, the terrorist Tsarnaev brothers have planted two lethal home-made pressure-cooker bombs. And at the height of the event, the terrorists remotely set them off, killing three people and maiming 264 civilians. Now, with the city plunged into chaos, a relentless area-wide manhunt begins, as the authorities, the F.B.I. and Tommy's comrades-in-arms comb the town to track down the murderers. Will the Bostonians let hate stain Patriots' Day?
                        """),
                        Movie(name: "Catch me if you can", yearOfRelease: 2002, imageName: "catchmeifyoucan", description: """
                        New Rochelle, the 1960s. High schooler Frank Abagnale Jr. idolizes his father, who's in trouble with the IRS. When his parents separate, Frank runs away to Manhattan with $25 in his checking account, vowing to regain dad's losses and get his parents back together. Just a few years later, the FBI tracks him down in France; he's extradited, tried, and jailed for passing more than $4,000,000 in bad checks. Along the way, he's posed as a Pan Am pilot, a pediatrician, and an attorney. And, from nearly the beginning of this life of crime, he's been pursued by a dour FBI agent, Carl Hanraty What starts as cat and mouse becomes something akin to father and son.
                        """),
                        Movie(name: "White Chicks", yearOfRelease: 2004, imageName: "whitechicks", description: """
                              Two disgraced African American FBI agents, siblings Kevin and Marcus Copeland, are assigned the duty of protecting cruise-line heiresses Brittany and Tiffany Wilson from a kidnapping plot. Their supervisor, Elliott Gordon has given them this duty as a last resort to being fired from the agency given their recent reputation. When the Wilson sisters suffer facial scars from a car accident, they refuse to leave the hotel. To save their jobs, the Copelands will do the unthinkable: disguise themselves as white women in the form of Wilson sister lookalikes
""")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func addMovie(_ sender: Any) {
        arrayMovies.append(Movie(name: "Name of the movie", yearOfRelease: 0000, imageName: "blank"))
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMovies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let lableName = cell.viewWithTag(1000) as! UILabel
        lableName.text = arrayMovies[indexPath.row].name
        
        let lableYearOfRelease = cell.viewWithTag(1001) as! UILabel
        let yearOfRelease = arrayMovies[indexPath.row].yearOfRelease
        lableYearOfRelease.text = String(yearOfRelease)
        
        // Configure the cell...
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: arrayMovies[indexPath.row].imageName)
        
        return cell
    }
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 160
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        detailVC.movie = arrayMovies[indexPath.row]
        navigationController?.show(detailVC, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
