import vtkStateBuilder from '@kitware/vtk.js/Widgets/Core/StateBuilder';

export default function generateState() {
  return vtkStateBuilder
    .createBuilder()
    .addStateFromMixin({
      labels: ['moveHandle'],
      mixins: ['origin', 'color', 'scale1', 'visible', 'manipulator'],
      name: 'moveHandle',
      initialValues: {
        scale1: 50,
        origin: [-1, -1, -1],
        visible: false,
      },
    })
    .addDynamicMixinState({
      labels: ['handles'],
      mixins: ['origin', 'color', 'scale1', 'visible', 'manipulator'],
      name: 'handle',
      initialValues: {
        scale1: 50,
        origin: [-1, -1, -1],
        visible: true,
      },
    })
    .build();
}
