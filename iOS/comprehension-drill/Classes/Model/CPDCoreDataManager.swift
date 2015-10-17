import CoreData


/// MARK: - CPDCoreDataManager
class CPDCoreDataManager {

    /// MARK: - class method
    static let sharedInstance = CPDCoreDataManager()


    /// MARK: - property
    var managedObjectModel: NSManagedObjectModel {
        let modelURL = NSBundle.mainBundle().URLForResource("CPDModel", withExtension: "momd")
        return NSManagedObjectModel(contentsOfURL: modelURL!)!
    }

    var managedObjectContext: NSManagedObjectContext {
        let coordinator = self.persistentStoreCoordinator

        let managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }

    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentsDirectory = documentsDirectories[documentsDirectories.count - 1] as NSURL
        let storeURL = documentsDirectory.URLByAppendingPathComponent("CPDModel.sqlite")

        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(
                NSSQLiteStoreType,
                configuration: nil,
                URL: storeURL,
                options: nil
            )
        } catch {
        }

        return persistentStoreCoordinator
    }


    /// MARK: - initialization
    init() {
    }

}
