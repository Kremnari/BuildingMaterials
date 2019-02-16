# BuildingMaterials
A mod for Factorio focused on changing buildings to be more expensive with their own intermediates

## Building Composition

Buildings will be composed of the following intermediates
  - structure
  - command and control (belts, electronics, pipes)
  - 1-3 components (internal operation
 
 ### Building Structure
 
 This represents the materials used to build the framework of the building.
   - Frame
   - Form
   - Fasten
   
These three things are known as precomposites in game
   
### Building Command and Control

The represents the materials used to provide internal routing and control.
There may also be need for more specialized components, varients of this.
Natively, there is a base version for buildings that process just items,
and an alternate which includes pump and piping.

  - Circuits/ Processors
  - Wiring
  - Inserters  (pumps)
  - Belts  (pipes)
   
 Combining cnc-item and cnc-fluid will yield a version that can be used for buildings that process both items and fluids
  
### Building Components

These are an (by default) auto-generated piece of the internal functionality of the building.
Buildings can be comprised of 1-4 of these, and these can be used between different buildings.
Components can be upgraded in tiers to build higher buildings


## Building Upgrading

Buildings can be decommissioned (uncrafted), returning their primary components and a portion of the cnc and structure materials.
